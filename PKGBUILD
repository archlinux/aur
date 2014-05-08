#Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xorg-twm-git
pkgver=1.0.8.r1.g9c09c3e
pkgrel=1
pkgdesc="Tab Window Manager for the X Window System"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
backup=(etc/X11/twm/system.twmrc)
license=('custom')
depends=('libxmu')
makedepends=('xorg-util-macros')
source=($pkgname::git://anongit.freedesktop.org/xorg/app/twm)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/twm-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  autoreconf -fiv
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 src/system.twmrc "$pkgdir/etc/X11/twm/system.twmrc"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

