# Maintainer: robertfoster
# Contributor: brikler

pkgname=fwts-git
pkgver=21.02.00.r7.3ba26885
pkgrel=1
pkgdesc="The FirmWare Test Suite is a tool to do automatic testing of a PC's firmware"
arch=('i686' 'x86_64')
url="http://smackerelofopinion.blogspot.com/2010/08/firmware-test-suite-biosacpi-health.html"
license=('GPL')
depends=('dtc' 'libbsd' 'pcre' 'json-c')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('git')
source=("${pkgname}::git://kernel.ubuntu.com/hwe/fwts.git")

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -ivf
  CPPFLAGS="$CPPFLAGS -O2"
  CFLAGS=--sysroot= ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/V//')"
}

md5sums=('SKIP')
