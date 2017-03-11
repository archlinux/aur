# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Contributor: Profpatsch <mail AT [nickname] DOT de>

pkgname=gnome-keysign
pkgver=0.8
pkgrel=1
pkgdesc="An easier way to sign OpenPGP keys over the local network."
arch=('any')
url="https://github.com/gnome-keysign/gnome-keysign"
license=('GPL3')
depends=('python2' 'python2-requests' 'python2-gobject' 'python2-qrcode'
         'avahi' 'dbus' 'monkeysign-git')
makedepends=('python2-setuptools')
source=(https://github.com/gnome-keysign/gnome-keysign/archive/${pkgver}.tar.gz
        "avoid_monkeysign.patch")
sha256sums=('141bdb20a84a3b1fb5deb0fc52c5af0e02c601b2cc4923f89409b2a1b8509f88'
            'c749fed5028b61c99292416f980decb23f9b90ce96eae05190aace764251575a')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/avoid_monkeysign.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
