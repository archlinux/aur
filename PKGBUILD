# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmodplug-git
pkgver=r299.g9357867
pkgrel=1
pkgdesc="A MOD playing library"
arch=('i686' 'x86_64')
url="https://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=("libmodplug=$pkgver")
conflicts=('libmodplug')
source=("git+https://git.code.sf.net/p/modplug-xmms/git")
sha256sums=('SKIP')


pkgver() {
  cd "git"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "git/libmodplug"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "git/libmodplug"

  make check
}

package() {
  cd "git/libmodplug"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libmodplug"
}
