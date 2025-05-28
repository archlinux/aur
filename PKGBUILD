# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>
# Contributor: <mumei AT airmail DOT cc>

pkgname=gnustep-gui
pkgver=0.32.0
pkgrel=1
pkgdesc="The GNUstep GUI class library"
arch=('x86_64')
url="https://github.com/gnustep/libs-gui"
license=('LGPL')
depends=(
	'gcc-libs'
        'libjpeg'
        'libpng'
        'libtiff'
)
makedepends=(
	'gcc-objc'
        'gnustep-base'
        'gnustep-make'
)
optdepends=(
	'aspell'
        'audiofile'
        'flite1: required for speech synthesis'
        'giflib'
        'libao'
        'libcups'
        'libsndfile'
)
conflicts=('gnustep-gui-svn')
groups=('gnustep-core')
options=('!makeflags')
source=(https://github.com/gnustep/libs-gui/releases/download/gui-${pkgver//./_}/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('0c03a1b6313babd592ec58fcb825091f77eb27429a4ce4306ec3a7cfa7f9a1f6'
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
  make DESTDIR="$pkgdir" install
}
