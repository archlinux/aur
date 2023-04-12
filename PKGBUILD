# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ncrack-git
pkgver=0.7.r54.g7fab46a
pkgrel=1
pkgdesc="High-speed network authentication cracking tool"
arch=('i686' 'x86_64')
url="https://nmap.org/ncrack/"
license=('GPL2')
depends=('glibc' 'openssl')
makedepends=('git')
provides=("ncrack=$pkgver")
conflicts=('ncrack')
source=("git+https://github.com/nmap/ncrack.git")
sha256sums=('SKIP')


pkgver() {
  cd "ncrack"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ncrack"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "ncrack"

  make DESTDIR="$pkgdir" install
}
