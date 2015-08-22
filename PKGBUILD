# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=pomodoro-applet
pkgver=1.0
pkgrel=1
pkgdesc="GNOME Panel applet for timing the intervals used in the Pomodoro Techinique(tm)"
arch=('i686' 'x86_64')
url="https://github.com/stump/pomodoro-applet"
license=('GPL')
depends=('gnome-panel')
makedepends=('intltool')
install=$pkgname.install
source=(http://ftp.stump.io/software/$pkgname/$pkgname-$pkgver.tar.gz
        0001-Port-to-libpanel-applet-5-and-gstreamer-1.0.patch)
md5sums=('39c1a7f6892c6764c3ab78962c830d14'
         '649185c6208949ec54af7edd6207e2df')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../0001-Port-to-libpanel-applet-5-and-gstreamer-1.0.patch
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
