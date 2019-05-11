# Maintainer: Davide Depau <davide@depau.eu>
_pkgname=libdbusaccess
pkgname=${_pkgname}-git
pkgver=1.0.8.r0.gcf39757
pkgrel=1
pkgdesc="Access control over D-Bus"
arch=('i686' 'x86_64')
depends=('glib2' 'dbus')
makedepends=('git' 'make' 'bison' 'flex')
url="https://git.sailfishos.org/mer-core/libdbusaccess"
license=('BSD')
source=(${_pkgname}::git+https://git.sailfishos.org/mer-core/libdbusaccess.git)
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make KEEP_SYMBOLS=1 release pkgconfig
  make KEEP_SYMBOLS=1 -C tools/dbus-creds release
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install-dev
  make DESTDIR="$pkgdir" -C tools/dbus-creds install
}
