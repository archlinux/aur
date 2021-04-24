# Maintainer: robertfoster
# Contributor: brikler

pkgname=fwts-git
pkgver=21.03.00.r56.69c98101
pkgrel=1
pkgdesc="The FirmWare Test Suite is a tool to do automatic testing of a PC's firmware"
arch=('i686' 'x86_64')
url="https://github.com/ColinIanKing/fwts"
license=('GPL')
depends=('dtc' 'libbsd' 'pcre' 'json-c')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('git')
source=("${pkgname%-git}::git+${url}")

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -ivf
  CPPFLAGS="$CPPFLAGS -O2"
  CFLAGS=--sysroot= ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/V//')"
}

sha256sums=('SKIP')
