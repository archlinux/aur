# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-qsymm
pkgver=1.4.0
pkgrel=1
pkgdesc="Symmetry finder and symmetric Hamiltonian generator"
arch=('any')
url="https://gitlab.kwant-project.org/qt/qsymm"
license=('BSD')
depends=(python python-numpy python-scipy python-tinyarray python-sympy)
makedepends=(python-setuptools)
optdepends=(
    'python-kwant: extends Kwant for finding symmetries of Hamiltonians'
)
checkdepends=(python-pytest)
source=(
    https://gitlab.kwant-project.org/qt/qsymm/-/archive/v${pkgver}/qsymm-v${pkgver}.tar.gz
)
sha256sums=('3561065de889d34cc8733fe54f3c666f35bed1a15388f076703a5256ddbfc563')

build() {
    cd "$srcdir/qsymm-v${pkgver}"
    python setup.py build
}

check() {
    cd  "$srcdir/qsymm-v$pkgver"
    pytest
}

package() {
    cd "$srcdir/qsymm-v${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/qsymm-v${pkgver}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || \
        return 1
}

