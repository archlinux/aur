# Maintainer: uli <cybuzuma at vnxs dot de>

pkgname=opencpn-plugin-o_charts
pkgver=1.0.34.0
pkgrel=1
pkgdesc="use charts from o-charts.org in opencpn"
arch=('x86_64' 'aarch64')
license=("GPL2" "custom")
depends=('opencpn' 'libusb-compat')
makedepends=('cmake' 'lsb-release')
url="https://opencpn.org/OpenCPN/plugins/ocharts.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdbcat/o-charts_pi/archive/refs/tags/${pkgver}.tar.gz" "LICENSE")
b2sums=('98593b46bcc000d494328cbbef25f1ec5f4aa9e56c243e8f3e5cd44a0c88e204fa1b665007fe7935ce66c7c69918d5a61ff7a236d6d942393b196d5f803b8b61' '2d09f9bc4f793b03977d05607f065fbd85e8c257edb70d27b8846f620f920d23803e320045ae3e6cc23e862d0c52336b8e334580d946518f86f4260c0a886deb')

build() {
  cd o-charts_pi-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make tarball
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # upstream is using make install for their packaging so we need to copy the files manually
  cd o-charts_pi-${pkgver}/build/app/o-charts-1.0-arch-rolling/
  cp -r ./* $pkgdir/usr/
  rm $pkgdir/usr/metadata.xml
}
