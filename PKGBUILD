# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: simo91 <simo91.linux@gmail.com>

pkgname=swfdec-gnome
pkgver=2.30.1
pkgrel=3
pkgdesc="Standalone Flash player and thumbnailer for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('libmad' 'swfdec')
makedepends=('intltool')
# AUR doesn't like ${pkgver%.*} or other bashish things in the $source, just hardcode 2.30
source=(https://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2 accept_8_or_9.patch no_gconf.patch)
options=('!libtool' '!emptydirs')

build() {
    cd "$srcdir"/${pkgname}-${pkgver}
    patch -Np1 -i ../accept_8_or_9.patch
    patch -Np1 -i ../no_gconf.patch
    autoconf

    ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install
    make
}

package() {
    cd "$srcdir"/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

sha256sums=('e684a2ae44ff52b925796734813c32fa222d4aba0aa85fd77276e99a12317b88'
            '176c83f41870107c3d16a60f5e09eae3b1bb811ed8c4fc1376654969df437420'
            '2026b021edabfe1a6622fc5670ca43a91063a4d3887bcaaf2b09d5250ce9f102')
