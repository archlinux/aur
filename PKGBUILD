# Maintainer: Stephen Power <simpill at gmail dot com>

pkgname=discord-rpc-lsp-git
pkgrel=1
pkgver=0.0.0
pkgdesc="A Language Server Protocol (LSP) to share what you're coding on Discord."
arch=('any')
url="https://github.com/zerootoad/discord-rpc-lsp"
sha256sums=(SKIP)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
license=('GPL-3.0-or-later')
optdepends=("arrpc: open source implementation of Discord's desktop RPC server API."
            "helix: text editor with strong LSP configuration capabilities.")
makedepends=('git' 'go')

prepare() {
    cd "${pkgname%-git}"  
    go mod init github.com/zerootoad/discord-rpc-lsp
    go mod tidy
}

build() {
    cd "${pkgname%-git}"
    go build
}

package() {
    cd "${pkgname%-git}"

    install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
}

