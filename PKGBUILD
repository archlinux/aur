# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=4.0.1
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('GPL')
depends=('python-requests-oauthlib' 'python-pynacl' 'mypy' 'dbus-python' 'python-gobject'
         'hicolor-icon-theme' 'python-wheel' 'python-argparse' 'python-eduvpn_common'
         'python-pyqt5' 'libibus' 'libgexiv2')
optdepends=('networkmanager-openvpn: For using NM to manage OpenVPN tun devices')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://github.com/eduvpn/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar".{xz,xz.asc})
sha256sums=('cd2cb4f628f7dd3d7b36dc6b65b843fa674af59e3fba8dd92c3539198e65a96d'
            'SKIP')
validpgpkeys=('227FF3F8F829D9A9314D9EBA02BB8048BBFF222C')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}
