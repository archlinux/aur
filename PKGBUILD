# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=sensors-applet
pkgver=3.0.0
pkgrel=4
pkgdesc="Applet for GNOME Flashback panel to display readings from hardware sensors, including CPU temperature, fan speeds and voltage readings"
arch=('i686' 'x86_64')
url="http://sensors-applet.sourceforge.net/"
license=('GPL')
depends=('gnome-panel' 'libatasmart' 'lm_sensors')
makedepends=('gnome-common' 'intltool' 'libxnvctrl' 'yelp-tools')
optdepends=('hddtemp: get HDD temperatures'
            'udisks: get HDD temperatures')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sensors-applet/$pkgname-$pkgver.tar.gz
        git-fixes.patch)
md5sums=('425078fc1ff5a98af1547e039002a73f'
         'cac4b6f28a493e904d76cfe400590d50')

prepare() {
  cd $pkgname-$pkgver

  # Apply fixes from git
  patch -Np1 -i ../git-fixes.patch

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
