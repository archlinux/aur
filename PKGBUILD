# Maintainer: Roman Beslik <me@beroal.in.ua>

_pkgname=scikeras
pkgname="python-${_pkgname}"
pkgver=0.12.0
pkgrel=1
pkgdesc="Scikit-Learn compatible wrappers for Keras Models"
arch=(any)
url="https://github.com/adriangb/${_pkgname}"
license=(MIT)
depends=(python python-importlib-metadata python-packaging python-numpy python-scipy python-scikit-learn python-tensorflow)
makedepends=(python-build python-installer python-wheel python-poetry)
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(a6a3281b7b45b43d3404f751acdfb2618daadfff0d18730d2b9314d43389001620da6077f7d50623d340677da1516885ab5bfccc02ad18a144fe5e0f31ea305b)

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
