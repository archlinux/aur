# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=blackboxwm
_realname=blackbox
pkgver=0.71.1
pkgrel=1
pkgdesc="A window manager for X11 (maintained fork of blackbox)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/blackboxwm"
license=('MIT')
provides=($_realname)
conflicts=($_realname)
replaces=($_realname)
depends=('libxext' 'libxft')
options=('!libtool' 'staticlibs')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$_realname-$pkgver.tar.bz2")
md5sums=('a38af493fcdbd9b5dab6277663961c6a')

prepare() {
  cd $_realname-$pkgver
  sed -i 's,@XFT_PKGCONFIG@,xft >= 2.0.0,;s,@LDFLAGS@,,;s,@ICONV@,,;s,@LOCALE@,,' lib/libbt.pc.in
}

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib --mandir=/usr/share/man
  make V=0
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
