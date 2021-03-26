# Maintainer: Jayson Reis <santosdosreis@gmail.com>
pkgname=python-autorepr
pkgver=0.3.0
pkgrel=1
pkgdesc="Makes civilized __repr__, __str__, and __unicode__ methods"
arch=('any')
url="https://github.com/wolever/autorepr"
license=('BSD')
makedepends=(
  'python-setuptools'
)
checkdepends=(
  'python-nose'
  'python-parameterized'
)
depends=(
  'python'
)
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('ef770b84793d5433e6bb893054973b8c7ce6b487274f9c3f734f678cae11e85e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i.bkp 's/nose_parameterized/parameterized/g' tests.py autorepr.py
  nosetests --with-doctest --doctest-options=+ELLIPSIS tests.py autorepr.py
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
