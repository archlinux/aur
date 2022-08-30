# Maintainer: Herman Rimm <herman_rimm at pm dot me>
pkgname=ivy-rs-git
pkgver=r27.cb79bcc
pkgrel=1
pkgdesc="Image viewer, yep it's written in Rust."
arch=('any')
url="https://codeberg.org/herman_rimm/${pkgname%-rs-git}"
license=('GPL3')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://codeberg.org/herman_rimm/${pkgname%-rs-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-rs-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-rs-git}"
	cargo build --release --locked
}

package() {
	cd "$srcdir/${pkgname%-rs-git}"
	install -D -m755 "target/release/${pkgname%-rs-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
