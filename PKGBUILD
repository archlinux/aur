# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmodplug-git
pkgver=r461.gd1b97ed
pkgrel=1
pkgdesc="A MOD playing library"
arch=('i686' 'x86_64')
url="https://modplug-xmms.sourceforge.net/"
license=('LicenseRef-libmodplug')
depends=('gcc-libs')
makedepends=('git')
provides=("libmodplug=$pkgver")
conflicts=('libmodplug')
source=("git+https://github.com/Konstanty/libmodplug.git")
sha256sums=('SKIP')


pkgver() {
  cd "libmodplug"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libmodplug"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libmodplug"

  make check
}

package() {
  cd "libmodplug"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libmodplug"
}
