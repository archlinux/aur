# Maintainer: CrankySupertoon <crankysupertoon@gmail.com>

pkgname=shticker-book-rewritten-git
_pkgname=shticker-book-rewritten
pkgver=1.2.1.1.r1.gbcb2537
pkgrel=1
pkgdesc="Custom launcher and tool for the Toontown Rewritten MMORPG"
url="https://github.com/CrankySupertoon/Shticker-Book-Rewritten"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'qt5-base' 'qt5-webengine')
makedepends=('git')
conflicts=('shticker-book-rewritten')
source=("$_pkgname::git+https://github.com/CrankySupertoon/Shticker-Book-Rewritten")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
  qmake-qt5
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
  install -m644 -D LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md \
      "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D shticker-book-rewritten.desktop \
      "$pkgdir/usr/share/applications/shticker-book-rewritten.desktop"
}

# vim:set ts=2 sw=2 et:
