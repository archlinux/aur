# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-typish
pkgver=1.9.3
pkgrel=2
pkgdesc='Functions for thorough checks on types'
arch=(x86_64)
url="https://github.com/ramonhagenaars/typish"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(
python-pycodestyle
python-pylint
mypy
python-pytest
python-coverage
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ramonhagenaars/typish/archive/v${pkgver}.tar.gz")
sha512sums=('baad9d2229ac289c4eb1d6e64bac0313efd4680f42a95270e0c1141d511392e6a95a5fea767943ddf432f5f0d48d95a05bbf26e06df188079ac177d321e4fa5c')

prepare(){
  msg2 "${MAKEFLAGS}"
}

build() {
  cd typish-${pkgver}
  python setup.py build
}

check(){
  cd typish-${pkgver}
  #python setup.py test
  #coverage run setup.py test
}

package() {
  cd typish-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # don't package test dir
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  rm -rf "${_i_dir}/tests"
}
