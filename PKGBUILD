# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-gui
pkgver=0.25.1
pkgrel=4
pkgdesc="The GNUstep GUI class library"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('LGPL')
depends=('aspell' 'gcc-libs' 'libcups' 'audiofile' 'libsndfile' 'giflib' 'libao')
makedepends=('gcc-objc' 'gnustep-base' 'gnustep-make')
conflicts=('gnustep-gui-svn')
groups=('gnustep-core')
options=('!makeflags')
source=(ftp://ftp.gnustep.org/pub/gnustep/core/$pkgname-$pkgver.tar.gz
        giflib-5.1.patch)
sha256sums=('3aacb277976014cfd4394084066187430100657dea234da91d9ae5015e747c66'
            '0c004c9816b626e168d085cc140c18bb6b5a2a06160aecfdffc0b00532fbed69')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
#  patch -Np1 -i ../giflib-5.1.patch
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
