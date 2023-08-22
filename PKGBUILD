# Maintainer: Kirill 'fidelicura' Bezuglyi <fidelicura@gmail.com>
pkgname='pacfo-git'
pkgver=r12.2ea1f12
pkgrel=1
pkgdesc="Prettify your pacman package info with user-friendly and lightweight CLI!"
arch=('x86_64')
url="https://github.com/fidelicura/pacfo"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('git' 'rust')
source=('git+https://github.com/fidelicura/pacfo.git')
md5sums=('SKIP')

pkgver() {
	cd pacfo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd pacfo
	cargo build --release
}

package() {
	cd pacfo
	install -Dm755 ./target/release/pacfo "$pkgdir/usr/bin/pacfo"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/pacfo"
}
