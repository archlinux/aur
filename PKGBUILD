# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dos2unix-git
pkgver=7.4.4.r2.g15f9f9d
pkgrel=1
pkgdesc="Convert text files with DOS or Mac line breaks to Unix line breaks and vice versa"
arch=('i686' 'x86_64')
url="https://waterlan.home.xs4all.nl/dos2unix.html"
license=('BSD')
depends=('glibc')
makedepends=('git' 'perl' 'po4a')
provides=("dos2unix=$pkgver")
conflicts=('dos2unix')
source=("git+https://git.code.sf.net/p/dos2unix/dos2unix")
sha256sums=('SKIP')


pkgver() {
  cd "dos2unix"

  git describe --long --tags | sed 's/^dos2unix-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dos2unix/dos2unix"

  make
}

check() {
  cd "dos2unix/dos2unix"

  make check
}

package() {
  cd "dos2unix/dos2unix"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING.txt" -t "$pkgdir/usr/share/licenses/dos2unix"
}
