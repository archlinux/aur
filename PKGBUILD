# Maintainer: M0Rf30

pkgname=libshout-idjc-git
pkgver=879.f155fa4
pkgrel=1
pkgdesc="Libshout library plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex' 'twolame')
makedepends=('git')
provides=('libshout')
conflicts=('libshout' 'libshout-idjc')
options=('!libtool' '!emptydirs')
source=('libshout-idjc::git://idjc.git.sourceforge.net/gitroot/idjc/idjc/')
license=('LGPL')

build()
{
  cd $srcdir/libshout-idjc
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/libshout-idjc
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd libshout-idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
