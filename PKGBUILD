# Maintainer: <mumei AT airmail DOT cc>

pkgname=gnustep-back
pkgver=0.30.0
pkgrel=1
pkgdesc="The GNUstep GUI Backend"
arch=('x86_64')
url="https://github.com/gnustep/libs-back"
license=('LGPL')
depends=(libgl libxmu gcc-libs freetype2 cairo)
makedepends=('gnustep-make' 'gnustep-base' 'gnustep-gui>=0.30.0' 'libffi' 'gcc-objc')
conflicts=('gnustep-back-svn')
groups=('gnustep-core')
source=(https://github.com/gnustep/libs-back/releases/download/back-${pkgver//./_}/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('60177d44beebd0216be4aa7eea6cf009cf9ff844bc35f0eacd622bf710372cff'
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
