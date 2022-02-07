# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=scikit-hep-testdata
pkgbase="python-${_pkgname}"
pkgname=("${pkgbase}")
pkgver=0.4.11
pkgrel=1
pkgdesc='A common package to provide example files (e.g. ROOT) for testing and developing packages against'
arch=('any')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest-runner')
depends=('python-pyaml' 'python-requests')
url="https://github.com/scikit-hep/${_pkgname}"
license=('BSD')

source=("${_pkgname}-${pkgver}::git+${url}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
