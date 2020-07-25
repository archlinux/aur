# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-back
pkgver=0.28.0
pkgrel=1
pkgdesc="The GNUstep GUI Backend"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('LGPL')
depends=(libgl libxmu gcc-libs freetype2 cairo)
makedepends=('gnustep-make' 'gnustep-base' 'gnustep-gui' 'libffi' 'gcc-objc')
conflicts=('gnustep-back-svn')
groups=('gnustep-core')
source=(https://github.com/gnustep/libs-back/releases/download/back-${pkgver//./_}/gnustep-back-$pkgver.tar.gz{,.sig})
sha256sums=('59e647f77c60d7edb2f0fe194ec4dfed7addc504a97a8ac5ad27a8c7ff11cdfa'
            'SKIP')
validpgpkeys=('83AAE47CE829A4146EF83420CA868D4C99149679')

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
