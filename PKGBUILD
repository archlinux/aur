# Maintainer: Roman Beslik <me@beroal.in.ua>

_pkgname=scikeras
pkgname="python-${_pkgname}"
pkgver=0.13.0
pkgrel=1
pkgdesc="Scikit-Learn compatible wrappers for Keras Models"
arch=(any)
url="https://github.com/adriangb/${_pkgname}"
license=(MIT)
depends=(python python-importlib-metadata python-packaging python-numpy python-scipy python-scikit-learn python-tensorflow)
makedepends=(python-build python-installer python-wheel python-poetry)
checkdepends=('python-pytest' 'python-responses')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(f47cec261085c0a69cf3836cf9068c4a98f7bdd5ea9384477bf5fbee2510067e43d90c541aa9f89944d7fd928a8be778026fdf63726eb69a1e15c2e96208df3f)

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
