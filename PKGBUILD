# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pygeos"
_name=${pkgname#python-}
pkgdesc="Wraps GEOS geometry functions in numpy ufuncs. "
url="https://pygeos.readthedocs.io/"

pkgver=0.12.0
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
sha256sums=("3c41542ef67c66015f443ae3e6e683503a8a221f9c24fb2380f6ae42aed1600a")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
