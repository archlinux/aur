# Maintainer: Versus Void <chaoskeeper at mail DOT ru>
pkgname=sccache-git
pkgver=r844.c701598
pkgrel=1
pkgdesc="ccache-like tool. Wraps compiler and avoids compilation when possible. Supports rustc"
arch=(i686 x86_64)
url="https://github.com/mozilla/sccache"
license=('Apache')
makedepends=('git' 'rust')
provides=('sccache')
conflicts=('sccache' 'sccache-bin')
install=sccache.install
source=('git+https://github.com/mozilla/sccache/')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release --all-features
}

#check() {
	#cd "$srcdir/${pkgname%-git}"
	#cargo test --release
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D target/release/sccache -t "$pkgdir"/usr/bin
	install -D target/release/sccache-dist -t "$pkgdir"/usr/bin
	install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/sccache
}
