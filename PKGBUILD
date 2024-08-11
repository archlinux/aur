# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
pkgver=4.4.0
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://github.com/eduvpn/python-eduvpn-client"
license=('GPL')
depends=('python' 'gobject-introspection-runtime'
         'python-requests-oauthlib' 'python-pynacl' 'dbus-python' 'python-gobject'
         'hicolor-icon-theme' 'python-eduvpn_common>=2.1.0'
         'python-pyqt5' 'libibus' 'libgexiv2'
         'libsecret' 'gdk-pixbuf2' 'libnotify' 'pango'
         'gtk3' 'libnm' 'networkmanager-openvpn')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/eduvpn/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar".{xz,xz.asc})
sha256sums=('2074488ebc8021e19c16acf904c5ac134fe00a56929a7c168637357f573af6f9'
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
