# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-tzfpy
_name=${pkgname#python-}
pkgver=1.3.2
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
sha256sums=('5f4dbe9be6957ba6eb16fb4deb67f0c14e8da2e46674ead2bd38dffa9c58da08')
build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
