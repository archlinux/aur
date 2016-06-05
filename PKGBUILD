# Maintainer: Riley Trautman <asonix.dev@gmail.com>

_pkgname=shticker-book-rewritten
pkgname=$_pkgname-git
pkgver=v1.0.3.5.gcd33bc4
pkgrel=1
pkgdesc="Custom launcher and tool for the Toontown Rewritten MMORPG"
url="https://github.com/madsciencecoder/Shticker-Book-Rewritten"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'qt5-base' 'qt5-webengine')
makedepends=('git' 'gcc')
provides=('shticker-book-rewritten')
conflicts=('shticker-book-rewritten')
source=("$_pkgname::git+https://github.com/madsciencecoder/Shticker-Book-Rewritten")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags |sed 's/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
  qmake
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
