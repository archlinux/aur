# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>
pkgname=python-pylatexenc
_name=${pkgname#python-}
pkgver=2.10
pkgrel=3
pkgdesc="Python library for encoding unicode to latex and for parsing LaTeX to generate unicode text"
arch=(any)
url="https://github.com/phfaist/pylatexenc"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/phfaist/pylatexenc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bcb859affea00b5acb25aec780620170ab9d385c8f7dc266b7237ce9f47a59fd')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.txt
}

check() {
    cd $_name-$pkgver
    PYTHONPATH=. pytest
}
