# Maintainer: CrankySupertoon <crankysupertoon@gmail.com>

pkgname=shticker-book-rewritten
pkgver=1.2.1.1
pkgrel=1
pkgdesc="Custom launcher and tool for the Toontown Rewritten MMORPG"
url="https://github.com/CrankySupertoon/shticker-book-rewritten"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'qt5-base' 'qt5-webengine')
makedepends=('git')
conflicts=('shticker-book-rewritten-git')
source=("${pkgver}.zip::${url}/archive/v${pkgver}.zip")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  git submodule init
  git submodule update
  qmake-qt5
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install
  install -m644 -D LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 -D README.md \
      "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -m644 -D shticker-book-rewritten.desktop \
      "${pkgdir}/usr/share/applications/shticker-book-rewritten.desktop"
}
