# Maintainer: George Tsiamasiotis <george@tsiamasiotis.gr>

pkgname=tayga-git
pkgver=git
pkgrel=1
pkgdesc="Simple, no-fuss NAT64 for Linux"
arch=('i686' 'x86_64')
url="https://github.com/apalrd/tayga"
license=('GPL-2.0-or-later')

makedepends=(git)
depends=(glibc)

provides=(tayga)
conflicts=(tayga)

source=("git+https://github.com/apalrd/tayga")
sha256sums=("SKIP")

backup=(etc/tayga/default.conf)

pkgver() {
  cd tayga
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd tayga
  make
}

check() {
  cd tayga
  make test
}

package() {
  cd tayga
  make DESTDIR="$pkgdir" WITH_SYSTEMD=1 \
    prefix="/usr" sbindir="/usr/bin" servicedir='/usr/lib/systemd/system' WITH_SYSTEMD=1 \
    install
}
