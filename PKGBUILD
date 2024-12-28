# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-wsgidav
_name=${pkgname#python-}
pkgver=4.3.3
pkgrel=4
pkgdesc="Generic WebDAV server based on WSGI"
arch=("any")
license=("MIT")
url="https://pypi.org/project/${_name}"
depends=(
    python
    python-defusedxml
    python-json5
    python-jinja
    python-lxml
    python-pymongo
    python-pyyaml
    uvicorn
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=(
    "python-cheroot: to use the built-in webserver"
    "python-pam: to use PAM for authentication"
)
source=(
    "${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
    "config.example.json5"
)
sha256sums=('5f0ad71bea72def3018b6ba52da3bcb83f61e0873c27225344582805d6e52b9e'
            '774ee839b5248d2614294daf2c8a28fda69f1524d8b5b61d9e75de7b9c986b4d'
            '25826e3ceec2e9e01c54e6367966537017b0c758c7eda131566a95f97b474250'
            '9e4d7e9ae9e56a5d0f14c91b296825114e57456888280e59dcf158dad36b9474'
            '28ee019fad42e9c7a2611147defec5e3bb6d2fbb3f5f69390a066f1c1033ef16')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-wsgidav/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
    install -Dm644 "${srcdir}/uwsgi.py" "${pkgdir}/usr/share/python-wsgidav/uwsgi.py"
    install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/usr/share/python-wsgidav/uwsgi.ini"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/python-wsgidav/config.example.json"
    install -Dm644 "${srcdir}/config.example.json5" "${pkgdir}/usr/share/python-wsgidav/config.example.json5"
    install -Dm644 "sample_wsgidav.yaml" "${pkgdir}/usr/share/python-wsgidav/config.example.yaml"
}
