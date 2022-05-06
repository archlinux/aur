# Maintainer: Eduardo Flores <edfloreshz@gmail.com>

pkgname=do-git
pkgrel=9
pkgver=0.1.3
pkgdesc="Do is a to-do app built for Linux with Rust and GTK."
arch=('x86_64')
url="https://github.com/edfloreshz/do"
license=('GPL2')
depends=('gtk4' 'libadwaita' 'pkg-config')
makedepends=('cargo' 'git')
optdepends=()
provides=('todo')
conflicts=('todo')
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
	install -Dm644 data/dev.edfloreshz.Do.desktop "$pkgdir/usr/share/applications/dev.edfloreshz.Do.desktop"
	install -Dm644 data/dev.edfloreshz.Do.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.edfloreshz.Do.svg"
	install -Dm664 data/dev.edfloreshz.Do.metainfo.xml "$pkgdir/usr/share/metainfo/dev.edfloreshz.Do.metainfo.xml"
	install -Dm644 README.md "$pkgdir/usr/share/doc/do/README.md"
	install -Dm755 target/release/todo "$pkgdir/usr/bin/todo"
}
