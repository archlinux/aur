# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-segno
_name=${pkgname#python-}
pkgdesc="Python QR Code and Micro QR Code encoder"
url="https://segno.readthedocs.io/"

pkgver=1.5.2
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
sha256sums=('983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
