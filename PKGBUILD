# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-accountsdialog
pkgver=1.8.1
pkgrel=1
pkgdesc="An application to view and modify user accounts information for MATE."
url="https://github.com/NiceandGently/mate-accountsdialog"
arch=('i686' 'x86_64')
license=('GPL')
depends=('accountsservice' 'apg' 'dbus-glib' 'gtk2' 'iso-codes' 'mate-desktop'
         'mate-polkit' 'libunique')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NiceandGently/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('acd991e284a28a0732cb8e37e5ffda01caf37155')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --enable-systemd
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
