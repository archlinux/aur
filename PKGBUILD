# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-syncthing
_name=${pkgname#python-}
pkgdesc="Python bindings to the Syncthing REST interface"
url="https://github.com/blakev/python-syncthing"

pkgver=2.4.2
pkgrel=1

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
b2sums=('9967dfd954b8f31ab3aa492d29c6aeddfa5b4fb9b1853ac8d4a18944f8f43a91b6ed867e7230867b7ebbb81a765c88daddbee8fbb7ee16c0cb2f2106cdc503f0'
        '93365beee887e2056a1d74533a1970287a2fca70fd0059e4372b78f3a238762a6c2c455a4985e00ce46cc27542df495debf33828625346351cf511258c3b05b8')

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
