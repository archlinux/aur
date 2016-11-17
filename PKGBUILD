# Maintainer: Matt Monaco <net 0x01b matt>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=xwiimote-git
_pkgname=xwiimote
pkgver=2.r28.gf2be57e
pkgrel=1
pkgdesc="Open Source Nintendo Wii Remote Linux Device Driver"
url="http://dvdhrm.github.io/xwiimote"
license=('MIT')
arch=('i686' 'x86_64')
depends=('libsystemd')
makedepends=('git')
conflicts=('xwiimote')
provides=('xwiimote')
backup=('etc/X11/xorg.conf.d/50-fix-xwiimote.conf')
source=('git://github.com/dvdhrm/xwiimote.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/^xwiimote-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --with-doxygen=no
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D "res/50-xorg-fix-xwiimote.conf" "$pkgdir/etc/X11/xorg.conf.d/50-fix-xwiimote.conf"
}

# vim:set ts=2 sw=2 et:
