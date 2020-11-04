# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-dunamai"
_name=${pkgname#python-}
pkgdesc="Produce dynamic, standards-compliant version strings"
url="https://github.com/mtkennerly/dunamai"

pkgver=1.3.1
pkgrel=1

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("879653e60fd0c9667bf48cb563bed668c498be48ce33628b5f140909579ada7b")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
