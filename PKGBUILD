# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Lukas1818 aur at lukas1818 dot de
# Contributor: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname="mstickereditor"
pkgver=0.1.1
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker for Matrix'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url='https://github.com/Lukas1818/mstickereditor'
depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo' 'clang' 'lld')
source=("https://github.com/Lukas1818/mstickereditor/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ea28239b0ca570f4472044c0cd6fc38d8bf2d1bcc3aa77d083bdbb760ef1b815f1f9c026471f2fe2335e29abce134dca47911eb0705196b642e67076c1cde162')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	cargo build --locked --release
	
	cd target/release
	mkdir -p share/bash-completion/completions
	./mstickereditor shell-completion bash > share/bash-completion/completions/mstickereditor
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "target/release/mstickereditor" -t "$pkgdir/usr/bin"
	cp -r "target/release/share" "$pkgdir/usr/share"
}
