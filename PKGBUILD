# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wsgidav
pkgver=3.0.3
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
    "https://files.pythonhosted.org/packages/ac/e1/4885f4d8f5b4275be418ebb1b1c76323304799f9c8bd40deeeba23787a29/WsgiDAV-3.0.3.tar.gz"
    "LICENSE-v${pkgver}::https://raw.githubusercontent.com/mar10/wsgidav/v${pkgver}/LICENSE"
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
    "config.example.json5"
)
sha256sums=(
    "bb1b8ded03daac0638e65385a805ae208d11afe07a1014cee746139fc6ffaad6"
    "488580937d6e2549a12454861c17b5106c0a62761f2f052ce2453097abbd841f"
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
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 "${srcdir}/LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
    install -Dm644 "${srcdir}/uwsgi.py" "${pkgdir}/usr/share/python-wsgidav/uwsgi.py"
    install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/usr/share/python-wsgidav/uwsgi.ini"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/python-wsgidav/config.example.json"
    install -Dm644 "${srcdir}/config.example.json5" "${pkgdir}/usr/share/python-wsgidav/config.example.json5"
}
