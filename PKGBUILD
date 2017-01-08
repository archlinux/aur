# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=wiggletools
pkgver=1.2.1
pkgrel=1
pkgdesc="basic operations on the space of numerical functions defined on the genome using lazy evaluators for flexibility and efficiency"
arch=('i686' 'x86_64')
url="https://github.com/Ensembl/WiggleTools"
license=('Apache')
depends=('gsl' 'htslib' 'libbigwig' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ensembl/WiggleTools/archive/v$pkgver.tar.gz")
md5sums=('516a63ee41dcf63104a0664735e75cee')

prepare() {
  cd $srcdir/WiggleTools-$pkgver

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i python/wiggletools/*.py
}

build() {
  cd $srcdir/WiggleTools-$pkgver

  make
}

check() {
   cd $srcdir/WiggleTools-$pkgver

   make test
}

package() {
  cd $srcdir/WiggleTools-$pkgver

  install -Dm755 bin/wiggletools $pkgdir/usr/bin/wiggletools

  for pythonscript in bin/*.py ; do
    install -Dm755 $pythonscript $pkgdir/usr/bin/$(basename $pythonscript .py)
  done

  for shellscript in bin/*.sh ; do
    install -Dm755 $shellscript $pkgdir/usr/bin/$(basename $shellscript .sh)
  done
}
