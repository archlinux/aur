# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Yejun Yang <yejunx AT gmail DOT com>
# Contributor: Biru Ionut <ionut@archlinux.ro>

pkgname=yate
pkgver=5.5.0
pkgrel=1
pkgdesc="Next-generation telephony engine"
arch=('i686' 'x86_64')
url="http://yate.null.ro"
license=('GPL')
depends=('speex' 'gsm' 'postgresql-libs' 'libmysqlclient' 'alsa-lib')
source=("http://yate.null.ro/tarballs/yate5/yate-${pkgver}-1.tar.gz")
options=(!makeflags)
sha256sums=('a9fc472df082e92d578efa3de54689e10ee1a24fdd67a9cc928db7c2e1568676')

build() {
  cd $srcdir/${pkgname}
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-libpq \
              --with-mysql \
              --without-openh323
  make
}

package(){
  cd $srcdir/${pkgname}
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
