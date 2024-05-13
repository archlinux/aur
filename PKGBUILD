# Maintainer: Korvin Roganov <korvinagor@vivaldi.net>

_pkgname=stylishcv
pkgname=stylishcv-git
pkgver=1.0.r5.g9c58b09
pkgrel=1
pkgdesc="A tweaked version and fork of latex-ninja's simple-hipstercv latex package"
arch=('any')
url="https://github.com/cryptection/stylishcv"
license=('CC BY-NC-SA 4.0')
depends=('texlive-latex' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-latexrecommended' 'texlive-pictures')
makedepends=('git')
conflicts=()
provides=()
source=("git+https://github.com/cryptection/stylishcv.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$_pkgname"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/StylishCV"
  # Install only cls and sty files
  install -Dm644 $_pkgname.cls $pkgdir/usr/share/texmf-dist/tex/latex/$_pkgname/$_pkgname.cls
  for file in $(ls *.sty); do
    install -m644 $file $pkgdir/usr/share/texmf-dist/tex/latex/$_pkgname/$file
  done
}
