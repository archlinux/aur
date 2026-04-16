# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=tmux-ai-titles
pkgver=0.2.0
pkgrel=1
pkgdesc="AI-powered title generation for tmux panes and windows"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/tmux-ai-titles"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e992b1ca552081926a5da8e0751768960795c6298bfa9df839462681c95f7c7e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/tmux-ai-titles "${pkgdir}/usr/bin/tmux-ai-titles"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
