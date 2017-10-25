# Maintainer: Nathan Ringo <remexre@gmail.com>
pkgname=oftb-git
pkgver=git20171024
pkgrel=1
pkgdesc="The OftLisp bootstrapper."
arch=(x86_64)
url="https://github.com/oftlisp/oftlisp-rs.git"
license=('MIT')
groups=()
depends=("oftlisp-std")
makedepends=('cargo' 'git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('oftlisp-rs::git+https://github.com/oftlisp/oftlisp-rs.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/oftlisp-rs"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/oftlisp-rs/${pkgname%-git}"
	cargo build --release --features rustyline
}

check() {
	cd "$srcdir/oftlisp-rs/${pkgname%-git}"
	cargo test --all
}

package() {
	cd "$srcdir/oftlisp-rs"
	install -Dt "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}
