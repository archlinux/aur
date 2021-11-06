# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-segno"
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.4.0
pkgrel=1

arch=("any")
license=("BSD")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-pypng"
    "pyzbar"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("d6b4e4512fa5cb32d2f988584d20e2e4d1daa97587cd5421cb705da994f3d65b")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
