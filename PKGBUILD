# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
pkgname="youtube-tui"
pkgver=0.7.3
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://siriusmart.github.io/youtube-tui'
license=('GPL')

depends=('gcc-libs' 'libsixel' 'libxcb')
makedepends=('cargo')
optdepends=('mpv: Default video player'
            'konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/youtube-tui/0.7.3/download")
sha512sums=('883491c331e7da2842af0306a2bb6c86835aaefa19ecc405ee08205711708c6474d0d07138c40b3654863efe614163b083b6969c89a70430303363548c0a0ef9')

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