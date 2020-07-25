# Maintainer: <mumei AT airmail DOT cc>

pkgname=gnustep-gui
pkgver=0.28.0
pkgrel=1
pkgdesc="The GNUstep GUI class library"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('LGPL')
depends=('aspell' 'gcc-libs' 'libcups' 'audiofile' 'libsndfile' 'giflib' 'libao')
makedepends=('gcc-objc' 'gnustep-base' 'gnustep-make')
optdepends=('flite1: required for speech synthesis')
conflicts=('gnustep-gui-svn')
groups=('gnustep-core')
options=('!makeflags')
source=(https://github.com/gnustep/libs-gui/releases/download/gui-${pkgver//./_}/gnustep-gui-$pkgver.tar.gz{,.sig})
sha256sums=('1f6d2de60417e8a674280de84077f94f7394ae4edb3fae9e04129743d7449317'
            'SKIP')
validpgpkeys=('83AAE47CE829A4146EF83420CA868D4C99149679')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/usr --sysconfdir=/etc/GNUstep
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
