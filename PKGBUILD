# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pygeos"
_name=${pkgname#python-}
pkgdesc="Wraps GEOS geometry functions in numpy ufuncs. "
url="https://pygeos.readthedocs.io/"

pkgver=0.11.1
pkgrel=1

arch=("x86_64")
license=("BSD")

makedepends=(
    "python-setuptools"
)
depends=(
    "cython"
    "geos"
    "python"
    "python-numpy"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("c9371ce412ab28e2d0e90a9d65e42eb9933d0dc33edf36c575d56187c6183acf")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
