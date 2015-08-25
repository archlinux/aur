# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=katarakt-git
pkgver=r187.ce41e7a
pkgrel=1
pkgdesc="A simple PDF viewer with two layouts"
arch=('i686' 'x86_64')
url="http://git.informatik.uni-erlangen.de/?p=katarakt"
license=('BSD')
depends=( qt4 poppler-qt )
optdepends=( )
makedepends=( asciidoc )
provides=( )
backup=( )
source=( git://git.informatik.uni-erlangen.de/katarakt )
md5sums=( SKIP )
_gitname="katarakt"


pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}"
  qmake-qt4
  make
  a2x -f manpage -a "date=`date +%Y-%m-%d`" doc/katarakt.txt
}

package() {
  cd $srcdir/$_gitname
  install -D -m755 katarakt "${pkgdir}/usr/bin/katarakt"
  install -D -m644 doc/katarakt.txt "${pkgdir}/usr/share/doc/${pkgname}/katarakt"
  install -D -m644 doc/katarakt.1 "${pkgdir}/usr/share/man/man1/katarakt.1"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

