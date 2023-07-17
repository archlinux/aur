# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="youtube-tui"
pkgname="youtube-tui"
pkgver=0.7.4
pkgrel=1
pkgdesc='An aesthetically pleasing YouTube TUI written in Rust'
url='https://siriusmart.github.io/youtube-tui'
license=('GPL')

depends=('gcc-libs' 'libsixel' 'libxcb')
makedepends=('cargo')
optdepends=('mpv: Default video player'
            'konsole: Default terminal emulator'
            'yt-dlp: Default YouTube downloader')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/youtube-tui/0.7.4/download")
sha512sums=('be2cc1b17cbe86be82c0ec69f7edb984659535cb37fc9c3fbda85512c40369d9036b8ec5735b4e1b73d42a43bb3b0fc5bcf5c026f102eb640a0dfab4fe2fe189')

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