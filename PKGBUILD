# Maintainer: kedap <kedap dot dev at protonmail dot com>

pkgname=devmode-git
_pkgname=devmode
pkgver=1e1be59
pkgrel=3
pkgdesc="Devmode is a code management utility for developers."
arch=('i686' 'x86_64')
url="https://github.com/edfloreshz/devmode"
license=('GPL2')
depends=()
makedepends=('cargo' 'git')
optdepends=()
provides=('devmode')
conflicts=('devmode')
source=("devmode::git+https://github.com/edfloreshz/devmode")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 target/release/dm "$pkgdir"/usr/bin/dm
	install -Dm644 "assets/docs/dmd.1" -t "$pkgdir"/usr/share/man/man1
}
