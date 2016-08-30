# Maintainer: Nikola Kotur <kotnick@gmail.com>
pkgname=rust-parallel-git
pkgver=0.1.0.r7.g6861710
pkgrel=1
pkgdesc="Command-line CPU load balancer written in Rust"
arch=('i686'
	'x86_64')
url="https://github.com/mmstick/parallel"
license=('MIT')
makedepends=(
    'rust>=1.11.0'
    'cargo>=0.12.0'
    'git>=1')
conflicts=('parallel')
source=('rust-parallel-git::git+https://github.com/mmstick/parallel.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -d -m 755 "$pkgdir/usr/bin"
	install -D -s -m 755 "target/release/parallel" "$pkgdir/usr/bin/parallel"
}
