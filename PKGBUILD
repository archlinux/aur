# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=greetd-ddlm-git
pkgver=r4.55fadbb
pkgrel=1
pkgdesc="deathowl's dummy login manager"
arch=('x86_64')
url="https://github.com/deathowl/ddlm"
license=('unknown')
depends=('greetd')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/ddlm -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
