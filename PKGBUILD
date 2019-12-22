# Maintainer: Jack Kamm <jackkamm at gmail dot com>
pkgname=biosyntax-less-git
pkgver=1.0.0.r11.g5705f0c
pkgrel=1
pkgdesc="Syntax Highlighting for Computational Biology, less plugin"
arch=('any')
url="https://biosyntax.org/"
license=('GPL3')
depends=('less' 'source-highlight')
makedepends=('sed' 'git')
source=("biosyntax-git::git://github.com/bioSyntax/bioSyntax.git")
md5sums=('SKIP')

pkgver() {
  cd "biosyntax-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/biosyntax-git"

  sed -i 's|$HOME/.local/share/source-highlight|/usr/share/source-highlight|g' less/rc_append.txt
}

package() {
  cd "$srcdir/biosyntax-git"

  mkdir -p "$pkgdir/usr/share/source-highlight/"
  cp less/*.outlang "$pkgdir/usr/share/source-highlight/"
  cp less/*.lang "$pkgdir/usr/share/source-highlight/"
  cp less/*.style "$pkgdir/usr/share/source-highlight/"

  cp less/src-hilite-lesspipe-bio-LINUX.sh "$pkgdir/usr/share/source-highlight/src-hilite-lesspipe-bio.sh"
  chmod 755 "$pkgdir/usr/share/source-highlight/src-hilite-lesspipe-bio.sh"

  mkdir -p "$pkgdir/usr/share/biosyntax-less"
  cp less/rc_append.txt "$pkgdir/usr/share/biosyntax-less/"
}

# vim:set ts=2 sw=2 et:
