# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-wsgidav
_name=${pkgname#python-}
pkgver=4.3.4
pkgrel=1
pkgdesc="Generic WebDAV server based on WSGI"
arch=("any")
license=("MIT")
url="https://github.com/mar10/wsgidav"
depends=(
    gunicorn
    mercurial
    python
    python-cheroot
    python-defusedxml
    python-gevent
    python-json5
    python-jinja
    python-lxml
    python-mysqlclient
    python-pam
    python-passlib
    python-paste
    python-pymongo
    python-pyyaml
    python-redis
    uvicorn
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
source=(
    "${_name}::git+${url}.git#tag=v${pkgver}"
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
    "config.example.json5"
)
sha256sums=('f2e0ee7f08391b78f21454bbf755cfb28b9659338446d151dc3a4b7b53d92ee0'
            '774ee839b5248d2614294daf2c8a28fda69f1524d8b5b61d9e75de7b9c986b4d'
            '25826e3ceec2e9e01c54e6367966537017b0c758c7eda131566a95f97b474250'
            '9e4d7e9ae9e56a5d0f14c91b296825114e57456888280e59dcf158dad36b9474'
            '28ee019fad42e9c7a2611147defec5e3bb6d2fbb3f5f69390a066f1c1033ef16')

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-wsgidav/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
    install -Dm644 "${srcdir}/uwsgi.py" "${pkgdir}/usr/share/python-wsgidav/uwsgi.py"
    install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/usr/share/python-wsgidav/uwsgi.ini"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/python-wsgidav/config.example.json"
    install -Dm644 "${srcdir}/config.example.json5" "${pkgdir}/usr/share/python-wsgidav/config.example.json5"
    install -Dm644 "sample_wsgidav.yaml" "${pkgdir}/usr/share/python-wsgidav/config.example.yaml"
}
