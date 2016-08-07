# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-disk-utility
pkgver=1.8.0
pkgrel=1
pkgdesc="Disk management application for MATE."
url="https://github.com/NiceandGently/mate-disk-utility"
arch=('i686' 'x86_64')
license=('GPL')
depends=('avahi' 'caja' 'dbus' 'gtk2' 'libatasmart' 'libsecret' 'libnotify'
         'libunique' 'udisks')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NiceandGently/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('4d4431957438178c1538776db90acab97696be2d')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
