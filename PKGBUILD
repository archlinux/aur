# Maintainer: fclad <fcladera at fcladera.com>

_pkgname=moderncv
pkgname=texlive-moderncv-git
pkgver=2.0.0.r4.g5a6a8f5
pkgrel=1
pkgdesc=" A modern curriculum vitae class for LaTeX"
arch=('any')
url="https://github.com/xdanaux/moderncv"
license=('The LaTeX Project Public Li­cense, version 1.3c')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra' 'fontawesome.sty')
makedepends=('git')
install=$pkgname.install
conflicts=('texlive-moderncv')
provides=('texlive-moderncv')
# I use my personal repo until xdanaux adds a tag in his repo
source=("git+https://github.com/fcladera/moderncv.git")
md5sums=('SKIP')

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
}

