# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pynfft'
_pkgname='pyNFFT'
pkgver=1.3.2
pkgrel=1
pkgdesc="Python wrapper to the NFFT library."
arch=('x86_64')
url="https://github.com/pyNFFT/pyNFFT"
license=('GPL3')
checkdepends=('python-nose')
depends=('nfft')
makedepends=('cython')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "new-api.patch"
    "rewrite_hidden_symbols.patch")
sha256sums=('ae41e720e569d0d99e3a44c82c36b35a49cfc9ecc23a1cd039fe9e2895aada2c'
            'd44f3144cd2ace01f021f67b724cd4036c37c9b1fbcf85521788875216666f0b'
            '65a1407fddbc1cab3c6415e6341f79f8d14aa816fd9438a521f38390879cf7fb')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < ../new-api.patch
  patch -p1 < ../rewrite_hidden_symbols.patch
}

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build_ext --inplace
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build_ext install --root=$pkgdir
}

check(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}
# vim:ts=2:sw=2:et:
