#!/hint/bash
# Maintainer: alescdb

pkgname=air-git
pkgver=0.6.10
pkgrel=1
pkgdesc="A simple ChatGPT & Llama-cpp command line with ansi markdown display (written in Rust)"
arch=("x86_64")
url="https://github.com/alescdb/air.git"
license=('Apache')
makedepends=(rust clang)
conflicts=('aid')
source=('air-git::git+https://github.com/alescdb/air.git')
provides=("air=${pkgver%%.r*}")
b2sums=('SKIP')
options=('!strip')

prepare() {
	cd ${pkgname}
}

build() {
	cd ${pkgname}
	cargo build --release
}

package() {
	cd ${pkgname}
	name=${pkgname%%-*}
	install -Dm755 ./target/release/$name -T ${pkgdir}/usr/bin/$name
	ln -sf /usr/bin/$name ${pkgdir}/usr/bin/aid
}
