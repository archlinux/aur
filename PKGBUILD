# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=codeberg-cli-git
pkgver=0.5.1.4f28814
pkgrel=2
pkgdesc='CLI Tool for Codeberg similar to gh and glab.'
arch=(x86_64)
url='https://codeberg.org/RobWalt/codeberg-cli'
license=(AGPL3)
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust' 'cargo')
provides=(codeberg-cli)
conflicts=(codeberg-cli)
source=(git+$url.git)
sha256sums=('SKIP')
md5sums=('SKIP')
options=('!lto')
install=codeberg-cli.install

pkgver() {
    	cd "$provides"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

build() {
	cd "$provides"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --all-features --release
}

check() {
	cd "$provides"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --all-features
}

package() {
	install -Dm755 "$srcdir/$provides/target/release/berg" "$pkgdir/usr/bin/codeberg-cli"
    install -Dm755 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
}
