# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: simo91 <simo91.linux@gmail.com>

pkgname=swfdec-gnome
pkgver=2.30.1
pkgrel=2
pkgdesc="Standalone Flash player and thumbnailer for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('gstreamer0.10-ffmpeg' 'libmad' 'swfdec')
makedepends=('intltool' 'gconf')
# AUR doesn't like ${pkgver%.*} or other bashish things in the $source, just hardcode 2.30
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2 accept_8_or_9.patch)
options=('!libtool' '!emptydirs')

build() {
    cd "$srcdir"/${pkgname}-${pkgver}
    patch -p0 <../accept_8_or_9.patch
    autoconf

    ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install
    make
}

package() {
    cd "$srcdir"/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
md5sums=('28a72e9c2ad79f33e4cf83bbd54fa124' '777a7ac9d98ea4c092dd181f22ca52bc')
