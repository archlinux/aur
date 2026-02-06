pkgname=libsmb2-git
pkgver=6.2.r163.gaedafb2
pkgrel=1
pkgdesc="Userspace client/server library for accessing or serving SMB2/SMB3 shares on a network"
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libsmb2"
license=('LGPL')
makedepends=('git')
provides=('libsmb2=$pkgver')
conflicts=('libsmb2')
options=('staticlibs')
source=("git+https://github.com/sahlberg/libsmb2.git")
sha256sums=('SKIP')

pkgver() {
  cd "libsmb2"
  git describe --long --tags | sed 's/^libsmb2-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libsmb2"
  chmod +x ./bootstrap
  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libsmb2"
  make check
}

package() {
  cd "libsmb2"
  make DESTDIR="$pkgdir" install
}
