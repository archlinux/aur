# Maintainer: eyelash <eyelash@users.noreply.github.com>

pkgname=xi-core-git
pkgver=r314.72295fa
pkgrel=1
pkgdesc='A modern editor with a backend written in Rust.'
arch=('i686' 'x86_64')
url='https://github.com/google/xi-editor'
license=('Apache')
makedepends=('git' 'cargo')
conflicts=('xi-core')
source=("$pkgname"::'git+https://github.com/google/xi-editor.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/rust"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname/rust"
	install -D target/release/xi-core "$pkgdir/usr/bin/xi-core"
}
