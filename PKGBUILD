# Maintainer: Guy Boldon <gb@guyboldon.com>

_pkgname=dataclass-wizard
pkgname=python-${_pkgname}
pkgver=0.32.0
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
sha256sums=('e8150463953d8a3293597c000fd2f26709fe8f61b82f6b043ad1fc8e75716538')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
