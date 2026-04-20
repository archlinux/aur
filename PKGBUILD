# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=tmux-ai-titles
pkgver=0.2.1
pkgrel=1
pkgdesc="AI-powered title generation for tmux panes and windows"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/tmux-ai-titles"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9293a9689ab5652e2b1b15c5f7e274dd041672784134bdb8da85190b90e22c5f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/tmux-ai-titles "${pkgdir}/usr/bin/tmux-ai-titles"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
