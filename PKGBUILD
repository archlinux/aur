# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-syncthing
_name=${pkgname#python-}
pkgdesc="Python bindings to the Syncthing REST interface"
url="https://github.com/blakev/python-syncthing"

pkgver=2.3.1
pkgrel=5

arch=("any")
license=("MIT")

makedepends=(
    "python-setuptools"
)
depends=(
    "python"
    "python-dateutil"
    "python-requests"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "requirements-versions.patch"
)
sha256sums=(
    "ad168e80c073aa6f87e71e0da6db6348b3c663586fb27d6568965f3a2be13343"
    "268b08ca14af7c134a4655c3a5d269f5256bcb891f0745f0c08a0c04615b6211"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input "${srcdir}/requirements-versions.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
