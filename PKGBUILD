# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=upx-git
pkgver=3.94.r143.g7a0514d9
pkgrel=1
pkgdesc="A free, portable, extendable, high-performance executable packer for several executable formats"
arch=('i686' 'x86_64')
url="https://upx.github.io/"
license=('GPL2')
depends=('gcc-libs' 'ucl' 'zlib')
makedepends=('git')
provides=('upx')
conflicts=('upx')
source=("git+https://github.com/upx/upx.git#branch=devel")
sha256sums=('SKIP')


prepare() {
  cd "upx"

  git submodule update --init --recursive --depth 1
}

pkgver() {
  cd "upx"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "upx"

  make all
}

package() {
  cd "upx"

  install -Dm755 "src/upx.out" "$pkgdir/usr/bin/upx"
  install -Dm644 "doc/upx.1" "$pkgdir/usr/share/man/man1/upx.1"
}
