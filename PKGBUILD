# Maintainer: Eduardo Flores <edfloreshz@gmail.com>

pkgname=do-git
pkgrel=4
pkgver=0.1.1
pkgdesc="Do is a to-do app built for Linux with Rust and GTK."
arch=('x86_64')
url="https://github.com/edfloreshz/do"
license=('GPL2')
depends=('gtk4' 'libadwaita' 'pkg-config')
makedepends=('cargo' 'git')
optdepends=()
provides=('do-app')
conflicts=('do-app' 'do')
source=("do-git::git+https://github.com/edfloreshz/do#branch=main")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm644 src/assets/res/do.edfloreshz.github.desktop "$pkgdir/usr/share/applications/do.edfloreshz.github.desktop"
	install -Dm644 src/assets/icons/do.edfloreshz.github.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/do.svg"
	install -Dm644 src/assets/icons/do.edfloreshz.github.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/do.svg"
	install -Dm644 README.md "$pkgdir/usr/share/doc/do/README.md"
	install -Dm755 target/release/do-app "$pkgdir/usr/bin/do-app"
}
