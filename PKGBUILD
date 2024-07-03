# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Filipp "Scorp" Andjelo <scorp@mailueberfall.de>

pkgname=syslog-notify
pkgver=0.2
pkgrel=3
pkgdesc="Pop-up display for system log messages"
arch=('i686' 'x86_64')
url="http://jtniehof.github.com/syslog-notify"
license=('GPL-2.0-or-later')
depends=('glib2' 'glibc' 'libnotify')
install=${pkgname}.install
source=($pkgname-$pkgver.tar.gz::https://github.com/jtniehof/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz
       ${pkgname}.patch)
md5sums=('1ab07dacff870c3cc3472a4f6e65d2c2'
         '3dc49b913d4ee1a00426fb993770084d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
#  patch -p1 -i ${srcdir}/${pkgname}.patch
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
