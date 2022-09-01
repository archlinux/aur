# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-main-view-source
pkgver=0.2.3
pkgrel=1
pkgdesc="This is a simple plugin for OBS Studio that provides a source to duplicate the main view"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/main-view-source.1501/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("827e5134001892a0a6171688b5bc57f7f97f710fc77169abe1210cb7d7990bf9")

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
