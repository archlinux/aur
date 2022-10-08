# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmo-gprs-git
pkgver=r67.4c624aa
pkgrel=1
pkgdesc="Osmocom GPRS libraries"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmo-gprs"
license=('GPL')
depends=('libosmocore')
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc' 'libtool' 'pkg-config')
conflicts=('libosmo-gprs')
provides=('libosmo-gprs')
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
              --sbindir=/usr/sbin \
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
