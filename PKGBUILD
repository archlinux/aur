# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-back
pkgver=0.25.1
pkgrel=2
pkgdesc="The GNUstep GUI Backend"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('LGPL')
depends=(libgl libxmu gcc-libs freetype2 cairo)
makedepends=('gnustep-make' 'gnustep-base' 'gnustep-gui' 'libffi' 'gcc-objc')
conflicts=('gnustep-back-svn')
groups=('gnustep-core')
source=(ftp://ftp.gnustep.org/pub/gnustep/core/$pkgname-$pkgver.tar.gz)
sha256sums=('ea563b7d6e4bd8b13856306c94bfe06b0909b71e62ab70dccf1c208f4889e2bf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/usr --sysconfdir=/etc/GNUstep
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/etc/ld.so.conf.d
  cat >"$pkgdir"/etc/ld.so.conf.d/gnustep.conf <<EOF
/opt/GNUstep/System/Library/Libraries
/usr/lib/GNUstep/Libraries
EOF
}
