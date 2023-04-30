# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
pkgname="youtube-tui"
pkgver=0.7.1
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://siriusmart.github.io/youtube-tui'
license=('GPL')

depends=('gcc-libs' 'libsixel' 'libxcb')
makedepends=('cargo')
optdepends=('mpv: Default video player'
            'konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/youtube-tui/0.7.1/download")
sha512sums=('837cc422eb4ab1a213d55028291a99a0d30f6e0c4c0c5523337772712079bfac323aff7e81bd734c3c8d1371a47e30ccd08612b6f9dbcd2aef82853c5a40e1b6')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/youtube-tui" -t "$pkgdir/usr/bin"
}