# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-gui
pkgver=0.27.0
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
sha256sums=('7991e435944d389366069888eb65b1ef08c5ab39f12b27e804bb372b941bd3d4'
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
