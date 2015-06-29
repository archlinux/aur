# Maintainer: Archer777 <NAME at gmx dot com>
# Contributor: Army
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

pkgname=conky-cli
pkgver=1.9.0
pkgrel=2
pkgdesc="Conky command line, without X11 dependencies"
arch=('i686' 'x86_64')
url="http://conky.sourceforge.net/"
license=("custom")
provides=('conky')
conflicts=('conky')
depends=('ncurses' 'wireless_tools')
source=("http://downloads.sourceforge.net/conky/conky-$pkgver.tar.gz")

build() {
  cd "$srcdir/conky-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-lua --disable-x11 \
      --disable-double-buffer --disable-xdamage --disable-own-window \
      --disable-xft --disable-hddtemp --disable-portmon --enable-wlan

  make
}

package() {
  cd "$srcdir/conky-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('1c8e715a2784d4d799f5fc0213e76d0f')
