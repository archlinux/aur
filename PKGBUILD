# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>
# Contributor: Profpatsch <mail AT [nickname] DOT de>

pkgname=gnome-keysign
pkgver=0.9.6
pkgrel=1
pkgdesc="An easier way to sign OpenPGP keys over the local network."
arch=('any')
url="https://github.com/gnome-keysign/gnome-keysign"
license=('GPL3')
install=gnome-keysign.install
depends=('python' 'python-cairo' 'python-dbus' 'python-gobject' 'python-gpgme'
         'python-qrcode' 'python-requests' 'python-twisted' 'avahi' 'dbus'
         'gst-plugins-good' 'gst-plugins-bad' 'zbar')
optdepends=('python-pybluez: Bluetooth support')
makedepends=('git' 'python-setuptools' 'python-lxml')
_commit=5d1c180dd9de8593036dbf05ab9990cb17534a2f  # tags/0.9.6
source=("git+https://gitlab.gnome.org/GNOME/gnome-keysign.git#commit=$_commit"
        "avoid_monkeysign.patch")
sha256sums=('SKIP'
            'e3aa40aeff35a8f7fcc6b7e79a3a3efb643bc2767766cbdc340a9860484734f2')

prepare() {
    cd $pkgname
    patch -Np1 -i "${srcdir}/avoid_monkeysign.patch"
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
