# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=geminicommit-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('2c79b3ccc99fe3d4a7f481aa1f5bf1b73f7eaa148027fc931c5e1417ac905423')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('eb7b22f44d3f260d22deec826e68a5382de5775d1866f1d41ccdcca14362873e')

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
