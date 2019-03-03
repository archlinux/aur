# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-qsymm
pkgver=1.1.2
pkgrel=1
pkgdesc="Symmetry finder and symmetric Hamiltonian generator"
arch=('any')
url="https://gitlab.kwant-project.org/qt/qsymm"
license=('BSD')
depends=(python python-numpy python-scipy python-tinyarray python-sympy)
optdepends=(
  'python-kwant: extends Kwant for finding symmetries of Hamiltonians'
)
checkdepends=(python-pytest)
source=(
    https://gitlab.kwant-project.org/qt/qsymm/-/archive/v${pkgver}/qsymm-v${pkgver}.tar.gz
)
sha256sums=('805dbb356fbaa3c2b875d56710827bf57792f24203a14348c6542ed1c82baed2')

build() {
    cd "$srcdir/qsymm-v${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/qsymm-v${pkgver}"
    python setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/qsymm-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}

check() {
    cd  "$srcdir/qsymm-v$pkgver"
    python setup.py test
}
