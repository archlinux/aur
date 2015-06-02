# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=squashfuse-git
pkgver=192.bb8f083
pkgrel=1
pkgdesc="FUSE filesystem to mount squashfs archives"
arch=('i686' 'x86_64')
url="https://github.com/vasi/squashfuse"
license=('BSD')
depends=('fuse')
source=('git+https://github.com/vasi/squashfuse.git' )
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"/squashfuse
}

build() {
  cd "$srcdir"/squashfuse
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/squashfuse
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir"/squashfuse
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
