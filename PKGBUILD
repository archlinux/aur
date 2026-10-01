# Maintainer: robertfoster
# Contributor: brikler

pkgname=fwts-git
pkgver=26.09.00.r0.f06eeafe
pkgrel=1
pkgdesc="The FirmWare Test Suite is a tool to do automatic testing of a PC's firmware"
arch=('x86_64')
url="https://github.com/fwts/fwts"
license=('GPL-2.0-or-later')
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
