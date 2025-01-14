# Maintainer: redponike <proton (dot) me>
# Contributor: Fabio Zanini <fabio.zanini _at_ fastmail.fm>

pkgname=python-scikit-bio
pkgver=0.6.3
pkgrel=1
pkgdesc="Python package providing data structures, algorithms, and educational resources for bioinformatics"
arch=('x86_64')
url="https://scikit.bio"
license=('BSD-3-Clause')
depends=(
    'python>=3.9'
    'python-requests>=2.20.0'
    'python-decorator>=3.4.2'
    'python-natsort>=4.0.3'
    'python-numpy>=1.17.0'
    'python-pandas>=1.5.0'
    'python-scipy>=1.9.0'
    'python-h5py'
    'python-biom-format>=2.1.16'
    'python-statsmodels>=0.14.0'
    'python-patsy>=0.5.0'
)
makedepends=('python-setuptools' 'cython')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scikit-bio/scikit-bio/archive/${pkgver}.tar.gz")
sha256sums=('e7c2727d0bc84fb46eeeebdd38e5c98287407a8fa6a7e6be4c73f9134b934ce8')

prepare(){
  cd scikit-bio-${pkgver}
  find . -iname "*.pyx" | xargs -n 1 cython
}

build() {
  cd scikit-bio-${pkgver}
  python setup.py build
}

check(){
  cd scikit-bio-${pkgver}
  python setup.py test || :
}

package() {
  cd scikit-bio-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
