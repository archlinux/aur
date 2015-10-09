# Contributor: Pierre Gueth <pierre.gueth at gmail>
#              Daniel YC Lin <dlin.tw at gmail>
#              Tim Huetz <tim at huetz biz>
# Maintainer: saxonbeta <saxonbeta at gmail>
# vim:set ts=2 sw=2 et:
pkgname=libsvm
pkgver=3.20
_pkgver=320
_pyver=3.5
pkgrel=3
pkgdesc="A library for Support Vector Machines classification, include binaries and python bindings."
arch=(x86_64 i686)
url="http://www.csie.ntu.edu.tw/~cjlin/libsvm/"
license=('BSD')
depends=()
optdepends=('python: bindings for latest python version'
'python2: bindings for python 2'
'java-environment: bindings for java' )
source=("https://github.com/cjlin1/libsvm/archive/v$_pkgver.tar.gz")
sha256sums=('e4be7fc8d2e7cb65feae4d6387967484c01c9dc818e7dfff515f663728a6f2ca') 

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  make lib all
}
package() {
  cd "$srcdir/$pkgname-$_pkgver"
  install -D -m755 svm-train $pkgdir/usr/bin/svm-train
  install -D -m755 svm-predict $pkgdir/usr/bin/svm-predict
  install -D -m755 svm-scale $pkgdir/usr/bin/svm-scale
  install -D -m644 java/libsvm.jar $pkgdir/usr/share/java/libsvm.jar
  install -D -m644 libsvm.so.2 $pkgdir/usr/lib/libsvm.so.2
  install -D -m644 svm.h $pkgdir/usr/include/svm.h
  ln -s libsvm.so.2 $pkgdir/usr/lib/libsvm.so
  mkdir -p $pkgdir/usr/share/licenses/libsvm
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/libsvm/LICENSE
  
  cd "python"
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' svm.py
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' svmutil.py
  install -D -m644 svm.py $pkgdir/usr/lib/python2.7/svm.py
  install -D -m644 svmutil.py $pkgdir/usr/lib/python2.7/svmutil.py
  sed -i 's_#!/usr/bin/env python2_#!/usr/bin/env python3_' svm.py
  sed -i 's_#!/usr/bin/env python2_#!/usr/bin/env python3_' svmutil.py
  install -D -m644 svm.py $pkgdir/usr/lib/python$_pyver/svm.py
  install -D -m644 svmutil.py $pkgdir/usr/lib/python$_pyver/svmutil.py
  
}

