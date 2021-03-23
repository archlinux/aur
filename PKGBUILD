# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-segno"
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.3.3
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
sha256sums=("505766f18c935f606097dc02280aa9cd28f21b3395ebf33292999af9e9d8f138")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
