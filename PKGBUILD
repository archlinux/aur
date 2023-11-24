# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=4.1.3
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('GPL')
depends=('python' 'gobject-introspection-runtime'
         'python-requests-oauthlib' 'python-pynacl' 'dbus-python' 'python-gobject'
         'hicolor-icon-theme' 'python-eduvpn_common>=1.1.0'
         'python-pyqt5' 'libibus' 'libgexiv2'
         'libsecret' 'gdk-pixbuf2' 'libnotify' 'pango'
         'gtk3' 'libnm')
optdepends=('networkmanager-openvpn: For using NM to manage OpenVPN tun devices')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/eduvpn/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar".{xz,xz.asc})
sha256sums=('1b6ba1c35f0e2f4426dd90b287f12c149aec1793bf93846afbb234b66f7663d3'
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
