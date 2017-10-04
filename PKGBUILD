# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Contributor: Profpatsch <mail AT [nickname] DOT de>

pkgname=gnome-keysign
pkgver=0.9.5
pkgrel=3
pkgdesc="An easier way to sign OpenPGP keys over the local network."
arch=('any')
url="https://github.com/gnome-keysign/gnome-keysign"
license=('GPL3')
install=gnome-keysign.install
depends=('python' 'python-requests' 'python-gobject' 'python-qrcode'
         'python-twisted' 'python-gpgme' 'avahi' 'dbus' 'zbar')
optdepends=('python-pybluez')
makedepends=('python-setuptools')
source=(https://github.com/gnome-keysign/gnome-keysign/archive/${pkgver}.tar.gz
        "avoid_monkeysign.patch")
sha256sums=('0bb55d834f957fe438dc32b311d7035f12cf36af07c3bded462fc9d72451a224'
            '74a1ac5d76d21977d2a8c3fcbc7630ccf063600ff94a30ba20df47984c44bf2e')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/avoid_monkeysign.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
