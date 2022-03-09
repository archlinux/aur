# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dunamai"
_name=${pkgname#python-}
pkgdesc="Produce dynamic, standards-compliant version strings"
url="https://github.com/mtkennerly/dunamai"

pkgver=1.10.0
pkgrel=1

arch=("any")
license=("MIT")

makedepends=(
    "python-importlib-metadata"
    "python-setuptools"
    "python-packaging"
)
depends=(
    "python"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("8f880666168bf7be6d795e39a6c80451caf7ec430f0f0c2d920e5d9bbb439b15")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
