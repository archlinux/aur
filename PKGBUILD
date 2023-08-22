# Maintainer: Kirill 'fidelicura' Bezuglyi <fidelicura@gmail.com>
pkgname='prop-git'
pkgver=r12.2ea1f12
pkgrel=1
pkgdesc="Lighweight, nice and distro-agnostic CLI app for viewing properties of files!"
arch=('x86_64')
url="https://github.com/fidelicura/prop"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('git' 'rust')
source=('git+https://github.com/fidelicura/prop.git')
md5sums=('SKIP')

pkgver() {
	cd prop
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd prop
	cargo build --release
}

package() {
	cd prop
	install -Dm755 ./target/release/prop "$pkgdir/usr/bin/prop"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/prop"
}
