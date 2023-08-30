# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
pkgname="youtube-tui"
pkgver=0.8.0
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://siriusmart.github.io/youtube-tui'
license=('GPL')

depends=('gcc-libs' 'libsixel' 'libxcb' 'mpv')
makedepends=('cargo')
optdepends=('konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/youtube-tui/0.8.0/download")
sha512sums=('c6d98b1f83e07a5e5c6877fcc9e34ab076ac8e63183ad6bafdbc5e2d9545873143e2c3c9d2e0c0568fd640b8254fd337b6a96b47ee75dd2b60b1952fc99bf183')

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