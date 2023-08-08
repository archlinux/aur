# Maintainer: Jonathan Hudson <jh+w1retap@daria.co.uk>
pkgname=w1retap
pkgver=1.55.r0.beaabb6
pkgrel=1
pkgdesc="one wire weather station data acquisition to RDBMS"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4' 'aarch64' 'riscv64')
license=('GPL2')
depends=('libusb' 'glib2')
makedepends=('git' 'meson')
optdepends=('libxml2: XML logs'
	    'unixodbc: Log to ODBC'
	    'postgresql-libs: Log to Postgresql'
	    'mariadb-libs: Log to MariaDB (Mysql)'
	    'sqlite3: Log to sqlite')
url='https://codeberg.org/stronnag/w1retap'
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname}"
  arch-meson build
  ninja -C build
}

package() {
  # executable
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ninja -C build install
}


# vim:set ts=2 sw=2 et:
