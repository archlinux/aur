# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=tmux-ai-titles
pkgver=0.1.0
pkgrel=1
pkgdesc="AI-powered title generation for tmux panes and windows"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/tmux-ai-titles"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('693a39adb047a88bdd505aa8a47c400588563369f8cddd15f91203dd0bab883c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/tmux-ai-titles "${pkgdir}/usr/bin/tmux-ai-titles"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
