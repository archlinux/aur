# Maintainer: Adrià Arrufat A <swiftscythe@gmail.com>

pkgname=geminicommit
pkgver=0.6.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
makedepends=('go')
source=("https://github.com/tfkhdyt/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dae3573367f6ac63e90c90070b592d3bcd2cc6c2b64ad7b399274f43bd0833d2')


build() {
    cd ${pkgname}-${pkgver}
    go build
    ./geminicommit completion bash >geminicommit.bash
    ./geminicommit completion zsh >_geminicommit.zsh
    ./geminicommit completion fish >geminicommit.fish
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 geminicommit "${pkgdir}/usr/bin/geminicommit"
    install -Dm644 geminicommit.bash "${pkgdir}/usr/share/bash-completion/completions/geminicommit"
    install -Dm644 _geminicommit.zsh "${pkgdir}/usr/share/zsh/site-functions/_geminicommit"
    install -Dm644 geminicommit.fish "${pkgdir}/usr/share/fish/vendor_completions.d/geminicommit.fish"
}
