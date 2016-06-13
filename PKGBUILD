# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=blackboxwm
_pkgname=blackbox
pkgver=0.71.2
pkgrel=2
pkgdesc="A window manager for X11 (maintained fork of blackbox)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/blackboxwm"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
depends=('libxext' 'libxft')
options=('!libtool' 'staticlibs')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
md5sums=('f75acef89e6aa543394350f7ddad97b8')

# is this necessary?
#prepare() {
#  cd $_pkgname-$pkgver
#  sed -i 's,@XFT_PKGCONFIG@,xft >= 2.0.0,;s,@LDFLAGS@,,;s,@ICONV@,,;s,@LOCALE@,,' lib/libbt.pc.in
#}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib --mandir=/usr/share/man \
    --enable-static --enable-shared
  make V=0
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
