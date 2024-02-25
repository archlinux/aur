# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=geminicommit-bin
pkgver=0.0.4
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('13f02fab7dee748338016ff2ae58c64ed2cbb765d24d8835271b361b84c4a45f')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('4b8a8e26f2ebf5861c8acf6c986badf30e46f19aa2d0385253d66e07391f60ba')

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
