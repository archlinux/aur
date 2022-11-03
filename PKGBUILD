# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-frame-interleave-filter
pkgver=0.1.1
pkgrel=1
pkgdesc="This plugin interleaves video frames to reduce CPU and GPU usage while the source is not displayed to the program"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-frame-interleave-filter.1618/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("59ce128c98eddb35766435a4019c574ce115ef24d87f4e93aa37986ea0488f8e")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
