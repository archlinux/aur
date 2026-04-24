# PKGBUILD
pkgname=dot-dotfiles
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple, opinionated dotfiles manager"
arch=('x86_64' 'aarch64')
url="https://github.com/sociale11/dot"
license=('MIT')
depends=('git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sociale11/dot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "dot-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags "-s -w" -o dot .
}

package() {
    cd "dot-${pkgver}"
    install -Dm755 dot "${pkgdir}/usr/bin/dot"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Shell completions
    ./dot completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/dot-dotfiles"
    ./dot completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_dot"
    ./dot completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/dot.fish"
}
