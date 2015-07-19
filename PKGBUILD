# Maintainer: Konstantin Shmelkov <konstantin@shmelkov.net>
pkgname=python2-nilearn
pkgver=0.1.4.post1
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=('any')
url="http://nilearn.github.io/"
license=('BSD')
depends=('python2-scikit-learn>=0.12' 'python2-nibabel>=1.10')
makedepends=('python2-setuptools')
optdepends=('python2-matplotlib: Plotting library for fancy examples')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/n/nilearn/nilearn-${pkgver}.tar.gz" "COPYING")
md5sums=('26c276f23fecc5b3e89be22c41a8a42e'
         '33ec80ab58266e76a552ebea227b6219')
sha256sums=('50a1aec049ffb5691a57113aed5fa3a028add157127310b8c97e2dc4d3a9fc24'
            'aff97bef794ee828d62ff0f4e8482ddc0f69cc27f9f016dc9e2c04ba5a84e6d4')

build() {
  cd "$srcdir"/nilearn-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/nilearn-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  #sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    #$(find "${pkgdir}" -name '*.py')

  install -m644 -D "$srcdir/COPYING" "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
