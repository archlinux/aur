#!/bin/bash
pkgname=python-decli
pkgver=0.6.1
pkgrel=0
pkgdesc="Minimal, easy to use, declarative command line interface tool"
arch=('any')
url="https://github.com/Woile/decli"
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
depends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d4c35cd54841d95eac9df0508f40c20a8df81c0c9e51c83f2a2285d35987010')

_pkgname="${pkgname/python-/}"

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  py.test -vvv tests/
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
