# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

_pkgname=qcore
pkgname="python-${_pkgname}"
pkgdesc='a library of common utility functions used at Quora'
pkgver='1.11.1'
pkgrel=1
url='https://github.com/quora/qcore'
arch=(x86_64)
license=(Apache-2.0)
checkdepends=(python-pytest)
makedepends=(cython python-build python-installer python-setuptools)
depends=(glibc python)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/quora/qcore/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(cdd963659c8d3426d04f5c74ace34f0015e8e0527bc962373361f2be53067376bf7355249dc96bbfd29aed6e5a901a003b6dc7dceb45b11e5517903321c7fdce)

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
