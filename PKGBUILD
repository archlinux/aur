# Maintainer: Adrià Arrufat A <swiftscythe@gmail.com>

pkgname=geminicommit
pkgver=0.6.1
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
makedepends=('go')
source=("https://github.com/tfkhdyt/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e26033eadc48a74f97104e7b3bbc730b32dfb93e33c2e7d13723291035cc4567')


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
