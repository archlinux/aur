# Maintainer: M0Rf30

pkgname=libshout-idjc-git
pkgver=891.61ef6b1
pkgrel=1
pkgdesc="Libshout library plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex' 'openssl' 'twolame')
makedepends=('git')
replaces=('libshout')
conflicts=('libshout-idjc')
options=('!emptydirs')
source=('libshout-idjc::git://idjc.git.sourceforge.net/gitroot/idjc/idjc/')
license=('LGPL')

prepare() {
  cd $srcdir/libshout-idjc/libshout-idjc
  sed -e 's/SSLeay_add_all_algorithms/OpenSSL_add_all_algorithms/g' -i src/tls.c
}

build(){
  cd $srcdir/libshout-idjc
  ./bootstrap
  cd libshout-idjc
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/libshout-idjc/libshout-idjc
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" uninstall-m4dataDATA
}

pkgver() {
  cd libshout-idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
