# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-messytables"
_name=${pkgname#python-}
pkgdesc="Parse messy tabular data in various formats"
url="https://messytables.readthedocs.io/"

pkgver=0.15.2
pkgrel=2

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-chardet"
    "python-dateutil"
    "python-html5lib"
    "python-lxml"
    "python-requests"
    "python-tableschema"
    "python-xlrd"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "LICENSE"
    "tableschema.patch"
)
sha256sums=(
    "227a5aac364919a7d3faa6ce04027fcbd03e041efcd3d57fabb1d1067591a2cd"
    "ec2a81b15d8ddae532b9e5b9bd325130758a77568869294a1450e0c11c5f24a6"
    "db238c07ae7944d9243f78f9e6137a32562fd8c807fb1e313cc9ea0c751f7abd"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input "${srcdir}/tableschema.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
