# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=squashfuse-git
pkgver=0.1.103.r46.ge5dddbf
pkgrel=1
pkgdesc="FUSE filesystem to mount squashfs archives"
arch=(x86_64)
url="https://github.com/vasi/squashfuse"
license=(custom)
provides=(squashfuse)
conflicts=(squashfuse)
depends=(fuse2 zstd)
makedepends=(git)
source=('git+https://github.com/vasi/squashfuse.git' )
sha256sums=('SKIP')

pkgver() {
  cd squashfuse
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd squashfuse
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd squashfuse
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}