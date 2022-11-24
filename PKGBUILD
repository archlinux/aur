# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=lcr-git
pkgver=r558.169afcc
pkgrel=2
pkgdesc="Linux Call Router"
arch=('x86_64' 'i686')
url="http://www.linux-call-router.de/"
license=('GPL')
depends=('sofia-sip' 'opencore-amr')
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc' 'libtool' 'pkg-config')
conflicts=('lcr')
provides=('lcr')
source=("git+https://gitea.osmocom.org/vyanitskiy/lcr.git#branch=fixeria/fixes")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -fi
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --docdir=/usr/share/doc/${pkgname%-git} \
              --libdir=/usr/lib/ \
              --sysconfdir=/etc \
              --with-sip \
              --with-gsm-bs
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}
