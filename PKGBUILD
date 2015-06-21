# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
# Contributor: Pascal E. <archlinux at hardfalcon dot net>

_pkgname=mfcuk
pkgname=mfcuk-svn
pkgver=94
pkgrel=2
pkgdesc="MiFare Classic Universal toolKit (MFCUK)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mfcuk/"
license=('GPL2')
depends=('libnfc>=1.7.0')
makedepends=('subversion')
provides=('mfcuk')
conflicts=('mfcuk')
source=("$_pkgname::svn+http://mfcuk.googlecode.com/svn/trunk")
md5sums=('SKIP')


pkgver() {
  cd $SRCDEST/$_pkgname
  svnversion | tr -d [A-z]
}

prepare() {
  sed -i 's/"\.\/data\//"\/usr\/share\/mfcuk\/data\//g' $_pkgname/src/mfcuk_finger.c
}

build() {
  cd $_pkgname
  autoreconf -is
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  mkdir -p "${pkgdir}/usr/share/${_pkgname}/data"
  cp -r "${srcdir}/${_pkgname}/src/data/tmpls_fingerprints" "${pkgdir}/usr/share/${_pkgname}/data/"
  make DESTDIR="$pkgdir/" install
}
