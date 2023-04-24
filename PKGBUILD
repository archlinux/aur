# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherfax
pkgver=1.9.56.0
pkgrel=1
pkgdesc="Open image files directly, or decode audio faxes to an image. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
optdepends=('rtl-sdr: decode from rtlsdr')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherfax.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weatherfax_pi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('05d5d3bd1557fdc4a407d79e504478fcf8c9a800d181bfd2ac8f9ef988a564cadb18318a69cb61454cf9ddc88f62c247054280d081cb6bc189a558cb73199989')

build() {
  cd weatherfax_pi-$pkgver
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON -DUSE_GL=ON ..
  make
}

package() {
  cd weatherfax_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
