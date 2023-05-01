# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=moderncv
pkgname=texlive-moderncv-git
pkgver=v2.3.1.r23.gfa3ebb6
pkgrel=1
pkgdesc=" A modern curriculum vitae class for LaTeX"
arch=('any')
url="https://github.com/moderncv/moderncv.git"
license=('The LaTeX Project Public Li­cense, version 1.3c')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra' 'ttf-font-awesome-5')
makedepends=('git')
conflicts=('texlive-moderncv')
provides=('texlive-moderncv')
# I use my personal repo until xdanaux adds a tag in his repo
source=("git+https://github.com/moderncv/moderncv.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i "/l3regex/d" moderncv.cls
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  # Install only cls and sty files
  install -Dm644 moderncv.cls $pkgdir/usr/share/texmf/tex/latex/moderncv/moderncv.cls
  for file in $(ls *.sty); do
    install -m644 $file $pkgdir/usr/share/texmf/tex/latex/moderncv/$file
  done
  # also install commons/colors.tex
  install -Dm644 commons/colors.tex $pkgdir/usr/share/texmf/tex/latex/moderncv/commons/colors.tex
}
