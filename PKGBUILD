# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wsgidav
pkgver=2.2.4
pkgrel=2
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
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
)
sha512sums=(
    "16cba8a6012576da88277525c297e7b8dcf0cf22beb6729829cafc4db1ad9ac28f87a753e8a0df665b8aac2fb525f4084c3b8e79faf38db2fb2903d60a83842f"
    "3cd7f0442c32c90a6c6ecc86f59fd8f684b8ae9edd7303588c3d821f03e64ada98e12b5982ec412eea84cffebdbcf159d343d6cf815dfdceb4abbb129a0a6d03"
    "0eb0563b1fda05af99c73d7824e4c410451b51bbf8ec9e65f702d6ce0a18998f31b05ba12d283d3f72a8d9c356bb0d19834868bc0705ce98e34b283b60ad0276"
    "a4f0de9c7625007efb0fe917da66c68a205b16035e8313663a9ab35a9bfe30afa814542f2ec9bb965d90911c2f1be0a4a389443efd5dab2e45c36d12c2371cb4"
    "d5286b64d083ac9fbfb49b6f71c0d06e21953b60bb7083a8affeceb9ffa28b7e4949233f63f7fd2d3d1de889ef3c1e91e77d6abbe06b88c626c4b5d2ac945f74"
)

build() {
    cd "WsgiDAV-${pkgver}"
    python setup.py build
}

package() {
    cd "WsgiDAV-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
    install -Dm644 "${srcdir}/uwsgi.py" "${pkgdir}/usr/share/python-wsgidav/uwsgi.py"
    install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/usr/share/python-wsgidav/uwsgi.ini"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/python-wsgidav/config.example.json"
}
