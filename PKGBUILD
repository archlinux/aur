# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=libosmocore-git
pkgver=0.9.6.r165.ff20641
pkgrel=1
pkgdesc="Osmocom core library"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmocore/wiki/Libosmocore"
license=('GPL')
depends=('pcsclite')
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc' 'libtool' 'pkg-config')
conflicts=('libosmocore')
provides=('libosmocore')
source=("git://git.osmocom.org/libosmocore.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
              --docdir=/usr/share/doc/libosmocore \
              --libdir=/usr/lib/
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}
