# Maintainer: Versus Void <chaoskeeper@mail.ru>
pkgname=sccache-git
pkgver=r655.1087c20
pkgrel=1
pkgdesc="ccache-like tool. Wraps compiler and avoids compilation when possible. Supports rustc"
arch=(i686 x86_64)
url="https://github.com/mozilla/sccache"
license=('Apache')
makedepends=('git' 'rust')
install=sccache.install
source=('git+https://github.com/mozilla/sccache/')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

#check() {
	#cd "$srcdir/${pkgname%-git}"
	#cargo test --release
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	cargo install --path . --root "$pkgdir/usr"
	rm  -f "$pkgdir/usr/.crates.toml"
}
