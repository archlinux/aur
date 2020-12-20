# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-typish
pkgver=1.9.1
pkgrel=1
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
sha512sums=('867694f5fee9387b14cc94d3741ada256b8a32db931f01576a4d38d78fd237fe708f8e890703db21ccb790ace5ff178a09cda28d8ab9164b6ecbb105eeefc670')

prepare(){
  msg2 "${MAKEFLAGS}"
}

build() {
  cd typish-${pkgver}
  python setup.py build
}

check(){
  cd typish-${pkgver}
  python setup.py test
  coverage run setup.py test
}

package() {
  cd typish-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
