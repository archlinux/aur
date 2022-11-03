# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-main-view-source
pkgver=0.2.4
pkgrel=1
pkgdesc="This is a simple plugin for OBS Studio that provides a source to duplicate the main view"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/main-view-source.1501/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("c302785242af68982a003f41762bb4d37f881634c48c853d7041b872e4dce631")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
