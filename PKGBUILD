# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname="cargo-doc2readme-git"
pkgver=0.1.6.r3.g32f28f8
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from your code'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

url="https://github.com/msrd0/cargo-doc2readme"
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('cargo-doc2readme')
provides=('cargo-doc2readme')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed -E 's,^([0-9\.]+)-([0-9]+)-(g[0-9a-f]+)$,\1.r\2.\3,'
}

prepare() {
	cd "$srcdir/$pkgname"
	cargo fetch --locked
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --offline --locked --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}
