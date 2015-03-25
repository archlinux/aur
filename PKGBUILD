# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Paulus Cyril <paulus.cyril@gmail.com>
pkgname=latex-make
pkgver=2.1.19
pkgrel=1
pkgdesc="A collection of LaTeX packages, scipts and Makefile fragments that allows to easily compile LaTeX documents."
arch=('any')
url="https://gforge.inria.fr/projects/latex-utils/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'python2')
source=(https://gforge.inria.fr/frs/download.php/34121/$pkgname-$pkgver.tar.gz)
md5sums=('6b62eb1e7de17d0224f77755d76f5f89')
sha256sums=('f4d2da7a1503fe0a39dd8c4913a8124d8faccee24bb2406d6aaa87a2bf8081e6')
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
