#!/bin/bash
pkgname=python-decli
pkgver=0.5.2
pkgrel=0
pkgdesc="Minimal, easy to use, declarative command line interface tool"
arch=('any')
url="https://github.com/Woile/decli"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python-dephell'
)
checkdepends=(
  'python-pytest'
)
depends=(
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1220794eaedc778f1c36d2656708ced782afbfd1d91cb45c4054f116a55c7bd3')

_pkgname="${pkgname/python-/}"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  py.test -vvv tests/
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
