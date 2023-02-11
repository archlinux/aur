# Maintainer: Guy Boldon <gb@guyboldon.com>

_pkgname=dataclass-wizard
pkgname=python-${_pkgname}
pkgver=0.22.2
pkgrel=2
pkgdesc="This library provides a set of simple, yet elegant wizarding tools for interacting with the Python dataclasses module."
arch=('any')
url="https://github.com/rnag/dataclass-wizard"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/rnag/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8d728db6a9c298117c886dbf5ba719aa7e369b9cfb28439770dfd6510ac64f02')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
