# Maintainer: Eduardo Flores <edfloreshz@gmail.com>

pkgname=do-git
pkgrel=8
pkgver=0.1.3
pkgdesc="Do is a to-do app built for Linux with Rust and GTK."
arch=('x86_64')
url="https://github.com/edfloreshz/do"
license=('GPL2')
depends=('gtk4' 'libadwaita' 'pkg-config')
makedepends=('cargo' 'git' 'diesel-cli')
optdepends=()
provides=('todo')
conflicts=('todo' 'do')
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
	install -Dm644 data/org.devloop.Do.desktop "$pkgdir/usr/share/applications/org.devloop.Do.desktop"
	install -Dm644 data/org.devloop.Do.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.devloop.Do.svg"
	install -Dm664 data/org.devloop.Do.metainfo.xml "$pkgdir/usr/share/metainfo/org.devloop.Do.metainfo.xml"
	install -Dm644 README.md "$pkgdir/usr/share/doc/do/README.md"
	install -Dm755 target/release/todo "$pkgdir/usr/bin/todo"
}
