# Maintainer: greembow <greembow@outlook.com>
pkgname=dotdotdot-git
pkgver=r11.2116ef3
pkgrel=1
pkgdesc="A variable-based dotfiles manager with a template engine for multi-machine deployments"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/greembow/dotdotdot"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('dotdotdot')
conflicts=('dotdotdot')
source=("$pkgname::git+https://gitlab.com/greembow/dotdotdot.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/dotdotdot" "$pkgdir/usr/bin/dotdotdot"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
