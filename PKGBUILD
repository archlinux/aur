# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pygeos"
_name=${pkgname#python-}
pkgdesc="Wraps GEOS geometry functions in numpy ufuncs. "
url="https://pygeos.readthedocs.io/"

pkgver=0.10.2
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
# checkdepends=(
#     "python-pytest"
# )

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("08cd7fe047a7d7f9f94eaa9a65e0b4fd4057ffebc15e6179a0290a9576a0bbbc")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

# check() {
#     cd "${srcdir}"/${_name}-${pkgver}
#     local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#     PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
