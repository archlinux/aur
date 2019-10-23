# Contributor: solnce <solnce at ratajczak dot one>
# Maintainer: solnce <solnce at ratajczak dot one>
# original code by Sunday87: https://bbs.archlinux.org/viewtopic.php?pid=1253365#p1253365

pkgname=texlive-most-doc
pkgver=20191023
pkgrel=1
pkgdesc="Most TeXLive documentation"
url="http://tug.org/texlive/"
arch=('any')
license=('unknown')
optdepends=('texlive-core: texdoc, mktexlsr hook, and many packages documented here')
makedepends=('rsync')
conflicts=(texlive-tlpdb)
options=('!strip'  '!purge')

pkgver() {
  date -I | tr -d '-'
}

build() {
  mkdir -p "$srcdir/usr/share/texmf-dist"
  mkdir -p "$srcdir/usr/share/tlpkg"
  rsync -av --no-o --no-g --chmod=D755,F644 rsync://tug.org/texlive/Contents/live/texmf-dist/doc "$srcdir/usr/share/texmf-dist/"
  rsync -av --no-o --no-g --chmod=D755,F644 rsync://tug.org/texlive/Contents/live/tlpkg/texlive.tlpdb "$srcdir/usr/share/tlpkg/"
}

package() {
  cp -rl "$srcdir"/* "$pkgdir"
}
