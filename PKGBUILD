# Maintainer: Rizal Nur A <rizal.jal2002@gmail.com>

pkgname=geminicommit-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('98c5496c0ccabe738128e85eee95478d88e9c487d535ae2defc4f73778ccf642')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('089796f469490d6de94334e3ee00ba64262aeaadc1bdf4c14d176dabce2bc0cf')

build() {
	./geminicommit completion bash >geminicommit.bash
	./geminicommit completion zsh >_geminicommit.zsh
	./geminicommit completion fish >geminicommit.fish
}

package() {
	install -Dm755 geminicommit "${pkgdir}/usr/bin/geminicommit"
	install -Dm644 geminicommit.bash "${pkgdir}/usr/share/bash-completion/completions/geminicommit"
	install -Dm644 _geminicommit.zsh "${pkgdir}/usr/share/zsh/site-functions/_geminicommit"
	install -Dm644 geminicommit.fish "${pkgdir}/usr/share/fish/vendor_completions.d/geminicommit.fish"
}
