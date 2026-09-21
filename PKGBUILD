# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-tzfpy
_name=${pkgname#python-}
pkgver=2.1.0
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
sha256sums=('fdacbe1e98b00dc9a9bd2cb442ca2b29b6f625c12efe06c1959628d3e735b174')
build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    find "$pkgdir" -path '*/sboms/*.cyclonedx.json' -exec sed -i "s|$srcdir|.|g" {} +
}
