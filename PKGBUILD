# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Jan Was <janek.jan@gmail.com>

pkgname=synce-core
pkgver=0.17
pkgrel=5
pkgdesc="provide a means of communication with a Windows CE device - libraries"
arch=('x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('dbus-glib' 'udev' 'python2' 'libgudev')
makedepends=('dhclient' 'python2-pyrex')
source=(http://downloads.sourceforge.net/sourceforge/synce/SynCE/synce-core/synce-core-$pkgver.tar.gz)
md5sums=('ee0b9369b6fea5e2d1b970503dd7cb0e')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  PYTHON=/usr/bin/python2 \
    ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/synce-core \
        --enable-odccm-support --enable-udev-support --enable-bluetooth-support
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
