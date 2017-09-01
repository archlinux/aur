# Maintainer: Christian Duerr <contact@christianduerr.com>
pkgname=rum-git
pkgver=0.1.0.r14.g3c3733c
pkgrel=1
pkgdesc='Rust Userstyle Manager'
arch=('i686' 'x86_64')
url='https://github.com/chrisduerr/rum'
license=('GPL3')
makedepends=('cargo' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd "${pkgname%-*}"
	cargo build --release
}

package() {
	cd "${pkgname%-*}"
	install -Dm755 target/release/rum "$pkgdir/usr/bin/rum"
}
