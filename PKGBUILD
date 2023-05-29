# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
pkgname="youtube-tui"
pkgver=0.7.2
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://siriusmart.github.io/youtube-tui'
license=('GPL')

depends=('gcc-libs' 'libsixel' 'libxcb')
makedepends=('cargo')
optdepends=('mpv: Default video player'
            'konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/youtube-tui/0.7.2/download")
sha512sums=('bb3bb97674c4b4a870e04c251ecee6d14c24c28ab3cec3d4cc7a506fc1fee3bdef2d234d39115ae78deeff7c5bfe650b601efc2dad4d5f8c336e4d1707551ff9')

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