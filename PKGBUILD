# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wsgidav
pkgver=2.2.4
pkgrel=1
pkgdesc="Generic WebDAV server based on WSGI"
arch=("any")
license=("MIT")
url="https://github.com/mar10/wsgidav"
depends=("python" "python-defusedxml")
makedepends=("python-setuptools")
optdepends=(
    "python-lxml: for faster XML processing"
    "python-cheroot: to use the built-in webserver"
)
source=(
    "https://pypi.python.org/packages/7e/75/9a56d97f19e2dad7166f48d073ad79678d8f26f195e9142b01c0e8fa5e94/WsgiDAV-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mar10/wsgidav/v${pkgver}/LICENSE"
)
sha512sums=(
    "16cba8a6012576da88277525c297e7b8dcf0cf22beb6729829cafc4db1ad9ac28f87a753e8a0df665b8aac2fb525f4084c3b8e79faf38db2fb2903d60a83842f"
    "3cd7f0442c32c90a6c6ecc86f59fd8f684b8ae9edd7303588c3d821f03e64ada98e12b5982ec412eea84cffebdbcf159d343d6cf815dfdceb4abbb129a0a6d03"
)

build() {
    cd "WsgiDAV-${pkgver}"
    python setup.py build
}

package() {
    cd "WsgiDAV-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
}
