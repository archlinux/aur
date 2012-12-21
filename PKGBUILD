# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-chewing
pkgver=0.1.3
pkgrel=2
pkgdesc="Fcitx Wrapper for chewing"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-chewing"
license=('GPL')
depends=('libchewing' 'fcitx>=4.2.6')
makedepends=('cmake' 'intltool')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz"
	"https://github.com/fcitx/fcitx-chewing/commit/3395ef29e7c43187dcd556f3396fec8aa8c1f60a.patch")

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  patch -Np1 -i "$srcdir/3395ef29e7c43187dcd556f3396fec8aa8c1f60a.patch"

  rm -rf build
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
md5sums=('052e3f146b6e2805918c008005fc9591'
         '60f54d8ef94f66f00f8e7982ddbbde6f')
