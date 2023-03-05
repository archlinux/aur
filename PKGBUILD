# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=4.0.0
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('Apache')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject'
         'hicolor-icon-theme' 'python-wheel' 'python-argparse' 'python-eduvpn_common'
         'python-pyqt5' 'libibus' 'libgexiv2')
optdepends=('networkmanager-openvpn: For using NM to manage OpenVPN tun devices')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://github.com/eduvpn/python-eduvpn-client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cc34df80bd610997b855b841642f51bc43be9e5b08f7d5aa265b6d0b864ab6cd')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}
