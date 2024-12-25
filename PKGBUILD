# Maintainer: redponike <proton (dot) me>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-biom-format
pkgver=2.1.16
pkgrel=1
pkgdesc="The Biological Observation Matrix (BIOM) Format Project"
arch=('x86_64')
url="http://biom-format.org"
license=('BSD-3-Clause')
depends=(
    'python-numpy'
    'python-click'
    'python-scipy'
    'python-pandas'
    'python-h5py'
)
makedepends=('python-setuptools' 'cython')
source=("https://github.com/biocore/biom-format/archive/${pkgver}.tar.gz")
sha256sums=('17e135c4ed7e003f7b35e7f7cec8ce02c1c22fd06ff6a404887ea1ef4205693a')

prepare(){
  cd "biom-format-$pkgver"
  find . -iname "*.pyx" | xargs -n 1 cython
}

build() {
  cd "biom-format-$pkgver"
  python setup.py build
}


package(){
  cd "biom-format-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
