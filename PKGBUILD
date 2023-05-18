# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=4.1.1
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('GPL')
depends=('python-requests-oauthlib' 'python-pynacl' 'dbus-python' 'python-gobject'
         'hicolor-icon-theme' 'python-eduvpn_common>=1.1.0'
         'python-pyqt5' 'libibus' 'libgexiv2'
         'libsecret' 'gdk-pixbuf2' 'libnotify' 'pango'
         'gtk3' 'libnm')
optdepends=('networkmanager-openvpn: For using NM to manage OpenVPN tun devices')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/eduvpn/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar".{xz,xz.asc})
sha256sums=('f51d82e271211d46c55b3643b70d0dc5e91e50e6b23ec76cb4a5e290ef345da7'
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
