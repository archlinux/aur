# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>

pkgname=tmux-mem-cpu-load-git
pkgver=3.7.0.r29.gdf71d21
pkgrel=1
pkgdesc='CPU, RAM memory, and load monitor for use with tmux'
url=https://github.com/thewtex/tmux-mem-cpu-load
arch=(x86_64)
license=(Apache-2.0)
makedepends=(cmake git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  install -Dm755 build/tmux-mem-cpu-load -t "$pkgdir/usr/bin"
}

