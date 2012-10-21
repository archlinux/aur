# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Paulus Cyril <paulus.cyril@gmail.com>
pkgname=latex-make
pkgver=2.1.18
pkgrel=1
pkgdesc="A collection of LaTeX packages, scipts and Makefile fragments that allows to easily compile LaTeX documents."
arch=('any')
url="https://gforge.inria.fr/projects/latex-utils/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'python2')
source=(https://gforge.inria.fr/frs/download.php/30927/$pkgname-$pkgver.tar.gz)
md5sums=('e4a3512b95533797191f6a019aeabecd')
sha256sums=('2e3a6097e498cfe010fbac4b73c43a212ceafc847c9daba214654cd4b177a1dd')
install=latex-make.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  for file in src/latex-make.dtx examples/bin/latex-make.dtx; do
    sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' $file
  done

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
