# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wsgidav
pkgver=3.1.0
pkgrel=1
pkgdesc="Generic WebDAV server based on WSGI"
arch=("any")
license=("MIT")
url="https://github.com/mar10/wsgidav"
depends=("python" "python-defusedxml" "python-setuptools" "python-yaml" "python-json5" "python-jinja" "python-six")
makedepends=("python-setuptools")
optdepends=(
    "python-lxml: for faster XML processing"
    "python-cheroot: to use the built-in webserver"
)
source=(
    "https://pypi.io/packages/source/W/WsgiDAV/WsgiDAV-${pkgver}.tar.gz"
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
    "config.example.json5"
)
sha256sums=(
    "963ce0ed546a7bd1ea00013599a4833f31d1fb5e88af71ab66bfc3bb55a14d8d"
    "774ee839b5248d2614294daf2c8a28fda69f1524d8b5b61d9e75de7b9c986b4d"
    "25826e3ceec2e9e01c54e6367966537017b0c758c7eda131566a95f97b474250"
    "9e4d7e9ae9e56a5d0f14c91b296825114e57456888280e59dcf158dad36b9474"
    "28ee019fad42e9c7a2611147defec5e3bb6d2fbb3f5f69390a066f1c1033ef16"
)

build() {
    cd "WsgiDAV-${pkgver}"
    python setup.py build
}

package() {
    cd "WsgiDAV-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-wsgidav/README.md"
    #install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/python-wsgidav/CHANGELOG.md"

    install -Dm644 "${srcdir}/uwsgi.py" "${pkgdir}/usr/share/python-wsgidav/uwsgi.py"
    install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/usr/share/python-wsgidav/uwsgi.ini"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/python-wsgidav/config.example.json"
    install -Dm644 "${srcdir}/config.example.json5" "${pkgdir}/usr/share/python-wsgidav/config.example.json5"
}
