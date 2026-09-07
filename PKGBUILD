# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-tzfpy
_name=${pkgname#python-}
pkgver=1.3.3
pkgrel=1
pkgdesc="Probably the fastest Python package to convert longitude/latitude to timezone name"
arch=('x86_64')
url="https://github.com/ringsaturn/tzfpy"
license=(MIT)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-maturin
)
optdepends=(
    python-pytz
    python-tzdata
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('827ff7c80cf0bf1c83e95e9550114cfb0687cd92586a188a0ba94c3422e0b9ae')
build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
