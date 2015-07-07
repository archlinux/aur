# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-mdp
pkgver=3.3
pkgrel=1
pkgdesc="Modular toolkit for Data Processing"
arch=('any')
url="http://mdp-toolkit.sourceforge.net/index.html"
license=('LGPL3')
depends=('python2-numpy')
optdepends=('python2-scipy: for faster eigensolver, FFT and convolution routines'
            'parallel-python: for parallel python scheduler'
            'shogun: for Shogun SVM classifier'
            'libsvm: for libSVM SVM classifier'
            'python2-joblib: for caching extension and caching context manager'
            'scikits-learn: for scikits-learn algorithms wrappers')

options=(!emptydirs)

source=("http://downloads.sourceforge.net/project/mdp-toolkit/mdp-toolkit/$pkgver/MDP-$pkgver.tar.gz")
md5sums=('5956284a419a431a980129485f111602')

build() {
  cd "$srcdir/MDP-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/MDP-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')
}

