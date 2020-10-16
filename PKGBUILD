# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-qsymm
pkgver=1.2.7
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
sha256sums=('7b542f0ea44f836eb879bd6bb19c6fcc749a0240b1b42cae9c873ab9012c6b1d')

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
    py.test
}
