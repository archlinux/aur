# Maintainer: Bryan Ndjeutcha <ndjeutcha@gmail.com>
pkgname=rivertiler-git
pkgver=r17.f42cac1
pkgrel=1
pkgdesc="tiling layout generator for river"
arch=('x86_64')
url="https://gitlab.com/snakedye/river-layouts"
license=('MIT')
makedepends=('git')
provides=("rivertiler-git")
conflicts=("rivertiler-git")
source=("$pkgname::git+https://gitlab.com/snakedye/river-layouts.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
	cd "$pkgname"
  install -Dm755 ./target/release/rivertiler "$pkgdir/usr/bin/rivertiler"
}

