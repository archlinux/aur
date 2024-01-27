# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmo-gprs-git
pkgver=r353.00cd941
pkgrel=1
pkgdesc="Osmocom GPRS libraries"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmo-gprs"
license=('GPL')
depends=('libosmocore')
makedepends=('git')
conflicts=('libosmo-gprs')
provides=('libosmo-csn1.so=0-64'
          'libosmo-gprs-gmm.so=0-64'
          'libosmo-gprs-llc.so=0-64'
          'libosmo-gprs-rlcmac.so=0-64'
          'libosmo-gprs-sm.so=0-64'
          'libosmo-gprs-sndcp.so=0-64')
source=("git+https://gitea.osmocom.org/osmocom/libosmo-gprs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --docdir=/usr/share/doc/libosmo-gprs \
              --libdir=/usr/lib/
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
