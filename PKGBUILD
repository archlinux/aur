# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=tmux-ai-titles
pkgver=0.1.2
pkgrel=1
pkgdesc="AI-powered title generation for tmux panes and windows"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/tmux-ai-titles"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('adcf78b73387ed9bec7d68a427bd2ac82311fe46e5323607e430e951670abf90')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/tmux-ai-titles "${pkgdir}/usr/bin/tmux-ai-titles"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
