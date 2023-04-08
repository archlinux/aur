# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}")
pkgver=0.4.25
pkgrel=2
pkgdesc='A common package to provide example files (e.g. ROOT) for testing and developing packages against'
arch=('any')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest')
depends=('python-pyaml' 'python-requests' 'python-importlib_resources')
url="https://github.com/scikit-hep/${_pkgname}"
license=('BSD')

source=("${_pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHONPATH=build/lib pytest tests
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
