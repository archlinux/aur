# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wsgidav
pkgver=3.0.1
pkgrel=1
pkgdesc="Generic WebDAV server based on WSGI"
arch=("any")
license=("MIT")
url="https://github.com/mar10/wsgidav"
depends=("python" "python-defusedxml" "python-setuptools" "python-yaml" "python-jsmin")
makedepends=("python-setuptools")
optdepends=(
    "python-lxml: for faster XML processing"
    "python-cheroot: to use the built-in webserver"
)
source=(
    "https://files.pythonhosted.org/packages/17/c4/360564dac7ad8f0a13914436b011dc520e898608cd80179b074ad6a27a0c/WsgiDAV-3.0.1.tar.gz"
    "https://raw.githubusercontent.com/mar10/wsgidav/v${pkgver}/LICENSE"
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
)
sha256sums=(
    "415ac221806a266a3661f6f2f91ecc8dbcbe3653cdb1508abc0c397ea0cf35f3"
    "efab1ba243ab3de9a6fb75068eb39424055408849aa3aabf085f0fca0a1be3d1"
    "7ca04465a67ec0726a4503aea86695e6d1948fa233dd2caa0fcee4db779aeaaf"
    "25826e3ceec2e9e01c54e6367966537017b0c758c7eda131566a95f97b474250"
    "3d114dd7275c40fde789a69eaaa8ddd0e5a1d803bf76948857eae7d9783cd761"
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
