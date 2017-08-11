# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbsd-git
pkgver=0.8.6.r0.gbbf90ac
pkgrel=1
pkgdesc="Provides useful functions commonly found on BSD systems"
arch=('i686' 'x86_64')
url="https://libbsd.freedesktop.org/wiki/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('libbsd')
conflicts=('libbsd')
options=('staticlibs')
source=("git+https://anongit.freedesktop.org/git/libbsd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libbsd"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libbsd"

  ./autogen
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libbsd"

  make check
}

package() {
  cd "libbsd"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libbsd/COPYING"
}
