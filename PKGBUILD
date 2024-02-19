# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=geminicommit-bin
pkgver=0.0.1
pkgrel=2
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('cdc4e296d4d4c2b8c3ca692b7bb337cd9b91a01f3ecc0d10045e462879b0227c')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/geminicommit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('efb0c6ce5b3a9b13981d6fe0382951586afe602f70781bda181a2a519f5a28f4')

build() {
	./geminicommit completion bash > geminicommit.bash
	./geminicommit completion zsh > _geminicommit.zsh
	./geminicommit completion fish > geminicommit.fish
}

package() {
	install -Dm755 geminicommit "${pkgdir}/usr/bin/geminicommit"
	install -Dm644 geminicommit.bash "${pkgdir}/usr/share/bash-completion/completions/geminicommit"
	install -Dm644 _geminicommit.zsh "${pkgdir}/usr/share/zsh/site-functions/_geminicommit"
	install -Dm644 geminicommit.fish "${pkgdir}/usr/share/fish/vendor_completions.d/geminicommit.fish"
}
