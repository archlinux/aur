# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=katarakt-git
pkgver=r240.e306cf2
pkgrel=1
pkgdesc="A simple PDF viewer with two layouts"
arch=('i686' 'x86_64')
url="https://gitlab.cs.fau.de/Qui_Sum/katarakt"
license=('BSD')
depends=( qt6-base poppler-qt6 )
optdepends=( )
makedepends=( asciidoc )
provides=( )
backup=( )
source=( git+https://gitlab.cs.fau.de/Qui_Sum/katarakt.git )
md5sums=( SKIP )
_gitname="katarakt"


pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}"
  qmake6
  make all doc
}

package() {
  cd $srcdir/$_gitname
  install -D -m755 katarakt "${pkgdir}/usr/bin/katarakt"
  install -D -m644 doc/katarakt.txt "${pkgdir}/usr/share/doc/${pkgname}/katarakt.txt"
  install -D -m644 doc/katarakt.1 "${pkgdir}/usr/share/man/man1/katarakt.1"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 -d "${pkgdir}/usr/share/${pkgname}/"
  install -m644 share/* "${pkgdir}/usr/share/${pkgname}/"
}

