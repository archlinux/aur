# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-mdp
pkgver=3.5
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
            'python2-scikit-learn: for scikits-learn algorithms wrappers')

options=(!emptydirs)

source=("http://downloads.sourceforge.net/project/mdp-toolkit/mdp-toolkit/$pkgver/MDP-$pkgver.tar.gz")
md5sums=('b8cba6097c932e77cf15f012ebc6d4be')

build() {
  cd "$srcdir/MDP-$pkgver"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find -name '*.py')

  python2 setup.py build
}

package() {
  cd "$srcdir/MDP-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

