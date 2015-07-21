# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Connor Behan <connor dot behan at gmail dot com>
# Contributor: Eric Bélanger <eric at archlinux dot org>

pkgname=gtk1
pkgver=1.2.10
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('libxi' 'glib1')
makedepends=('libxt')
provides=('gtk')
conflicts=('gtk')
replaces=('gtk')
install=${pkgname}.install
source=("ftp://ftp.gnome.org/pub/gnome/sources/gtk+/1.2/gtk+-${pkgver}.tar.gz"
        "aclocal-fixes.patch")
sha512sums=('6a05062520954287b0e24a95169d18c216145ee79d1fa7f54222db32c8e39e011e3dc49886d3bc4de1cc1ebd71f5744e41891cde8d5c2759f637e71c390a235f'
            'bfe3bbf3498cf2fa094fd7525e507cc81f916d1172df450a421fbe23ddae7d207b1c77f1d0db6bbd7e36c870002ec9aa06916a089f773f8e8470b26d2137c6f4')

prepare() {
  cd "${srcdir}/gtk+-${pkgver}"
  cp /usr/share/libtool/build-aux/config.guess .
  cp /usr/share/libtool/build-aux/config.sub .
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --infodir=/usr/share/info --with-xinput=xfree
  make
}

package() {
  cd "${srcdir}/gtk+-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
