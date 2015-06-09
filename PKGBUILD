# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-applets
pkgver=3.16.1
pkgrel=1
pkgdesc="Small applications for the GNOME panel"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cpupower' 'gucharmap' 'gstreamer0.10-base-plugins' 'gnome-panel>=3.16.1' 'libgtop' 'upower')
makedepends=('gnome-common' 'intltool' 'networkmanager' 'rarian' 'yelp-tools')
url="https://wiki.gnome.org/Projects/GnomeFlashback"
install=$pkgname.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('c656ecfc0a3af898e80f9c6971400f25e6cc8fe743fa0fd2b6a1a77a40005206')

build() {
  cd "$pkgname-$pkgver"

  # Turn off unneeded warnings
  CFLAGS="$CFLAGS -w"

  autoreconf -fi

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-install --with-cpufreq-lib=cpupower

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

