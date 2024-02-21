# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=geminicommit-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('05d5507bdc02996d1b5ff52b8fc07a04220603594ee08398ae75763540e341e1')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('8d87a82cf5f3dce9dc0287b1df019aa8feb04d4f7ab776e028fd220521d554d2')

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
