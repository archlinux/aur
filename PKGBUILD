# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-git
pkgver=1.0.2.r0.7a79878
pkgrel=1
pkgdesc="A command line time tracker"
arch=('i686' 'x86_64')
url="https://gitlab.com/categulario/tiempo-rs"
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
makedepends=('cargo' 'git')
provides=('tiempo')
conflicts=('tiempo')
source=("tiempo-git::git+https://gitlab.com/categulario/tiempo-rs")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

build() {
	cd "$pkgname"
	cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/t "$pkgdir"/usr/bin/t
}
