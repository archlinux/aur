# Maintainer: Guy Boldon <gb@guyboldon.com>

_pkgname=dataclass-wizard
pkgname=python-${_pkgname}
pkgver=0.36.2
pkgrel=1
pkgdesc="This library provides a set of simple, yet elegant wizarding tools for interacting with the Python dataclasses module."
arch=('any')
url="https://github.com/rnag/dataclass-wizard"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/rnag/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3037618b7424d7635d442750bd6e57cb72896ab1a3a49e886fcf3d45667183ad')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
