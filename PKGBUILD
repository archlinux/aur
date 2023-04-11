# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmd-git
pkgver=1.0.4.r18.g84d269e
pkgrel=1
pkgdesc="Message digest functions from BSD systems"
arch=('i686' 'x86_64')
url="https://www.hadrons.org/software/libmd/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=("libmd=$pkgver")
conflicts=('libmd')
options=('staticlibs')
source=("git+https://git.hadrons.org/git/libmd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libmd"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libmd"

  ./autogen
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libmd"

  make check
}

package() {
  cd "libmd"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libmd"
}
