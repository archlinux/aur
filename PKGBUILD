# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=popt-git
pkgver=1.18.r46.g1ffb350
pkgrel=1
pkgdesc="C library for parsing command line parameters"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/popt"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('popt')
conflicts=('popt')
options=('staticlibs')
source=("git+https://github.com/rpm-software-management/popt.git")
sha256sums=('SKIP')


pkgver() {
  cd "popt"

  git describe --long --tags | sed 's/^popt-//;s/-release//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "popt"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "popt"

  make check
}

package() {
  cd "popt"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/popt"
}
