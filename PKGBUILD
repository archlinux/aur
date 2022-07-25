# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=python-pylint-venv
_internal_pkgname=pylint-venv
pkgver=2.3.0
pkgrel=1
pkgdesc='Make pylint respect virtualenvs.'
arch=('any')
url="https://github.com/jgosmann/${_internal_pkgname}"
license=('MIT')
optdepends=('python-pylint: Kind of useless without it'
            'python-virtualenv: Kind of useless without it')
makedepends=(python-build python-installer python-wheel)

source=("https://github.com/jgosmann/${_internal_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/jgosmann/${_internal_pkgname}/raw/v${pkgver}/LICENSE.txt")
sha256sums=('82c0181f4fa0b862141f784bbd90207409642a6e6d74407e27b7d73f0f8bfe4d'
            'b6b087cae10c9386509b0590c190a5ef86075eca6626ecf6afc5254fc5fcc550')

build() {
    cd "${srcdir}/${_internal_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_internal_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "${srcdir}"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
