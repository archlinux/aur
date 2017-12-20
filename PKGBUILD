# Maintainer bonanza <illogical@protonmail.com>

pkgname=latex-pgfplots-git
pkgname_=pgfplots
pkgver=1.15
pkgrel=1
pkgdesc='Allows drawing normal and/or logarithmic plots directly in TeX'
arch=(any)
url=http://sourceforge.net/projects/pgfplots/
license=(GPL)
install=pgfplots.install
depends=(tetex)
conflicts=(texlive-pictures latex-pgfplots)
source=('pgfplots::git+https://git.code.sf.net/p/pgfplots/code')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname_"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname_"
    dest=${pkgdir}/usr/share/texmf-dist
    install -d $dest/scripts
    install -d $dest/tex/generic/$pkgname_
    install -d $dest/tex/latex/$pkgname_/libs

    cp -r scripts $dest
    cp -r tex/generic/$pkgname_/* $dest/tex/generic/$pkgname_
    cp -r tex/latex/$pkgname_/*.sty $dest/tex/latex/$pkgname_
    cp -r tex/latex/$pkgname_/libs/* $dest/tex/latex/$pkgname_/libs
}
