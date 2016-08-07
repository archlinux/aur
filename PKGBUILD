# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-color-manager
pkgver=1.8.1
pkgrel=2
pkgdesc="Color management application for MATE."
url="https://github.com/NiceandGently/${pkgname}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus' 'desktop-file-utils' 'exiv2' 'gtk2' 'lcms2' 'libcanberra' 'libcups' 'libexif'
         'libgudev' 'libnotify' 'libtiff' 'libunique' 'mate-desktop>=1.10' 'sane' 'vte')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NiceandGently/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('9eaadf8e809cb258042437f20efcebf4e56ca39f')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
