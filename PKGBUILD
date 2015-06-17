# Maintainer: M0Rf30

pkgname=libshout-idjc-git
pkgver=743.3ad46eb
pkgrel=1
pkgdesc="Libshout plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex')
makedepends=('git')
options=('!libtool' '!emptydirs')
source=('libshout-idjc::git://idjc.git.sourceforge.net/gitroot/idjc/idjc/')
license=('LGPL')

build()
{
  cd libshout-idjc
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make LDFLAGS+=-lspeex
}

package() {
  cd libshout-idjc
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd libshout-idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
