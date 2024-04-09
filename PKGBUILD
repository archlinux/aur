# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}")
pkgver=0.4.43
pkgrel=1
pkgdesc='A common package to provide example files (e.g. ROOT) for testing and developing packages against'
arch=('any')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest')
depends=('python-pyaml' 'python-requests' 'python-importlib_resources')
url="https://github.com/scikit-hep/${_pkgname}"
license=('BSD')

source=("${_pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('13f208d241d59723f001d9721b75b07bcd103478849cd6e7eee139a12074279d')

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
