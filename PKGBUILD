]#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=sliver-bin
pkgver=1.5.37
pkgrel=2
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('x86_64')
depends=()
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
install=
source_x86_64=("https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-client_linux" "https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-server_linux")
sha256sums_x86_64=('5fffcdd337374e2843c7582b798b983785da5ab3afb6e30b78cef4620d248b09' '996e7473634a2b894f6e154073d780b12f9ef1b8f1471bb945c7c2cf1c56010a')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/${pkgname%-bin}-server_linux" "$pkgdir/usr/bin/${pkgname%-bin}-server"
    install -m755 "$srcdir/${pkgname%-bin}-client_linux" "$pkgdir/usr/bin/${pkgname%-bin}-client"

    # Making completions
    chmod +x "$srcdir/${pkgname%-bin}-server_linux" "$srcdir/${pkgname%-bin}-client_linux"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    $srcdir/${pkgname%-bin}-server_linux completion bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}-server"
    $srcdir/${pkgname%-bin}-client_linux completion bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}-client"

    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    $srcdir/${pkgname%-bin}-server_linux completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-bin}-server.fish"
    $srcdir/${pkgname%-bin}-client_linux completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-bin}-client.fish"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    $srcdir/${pkgname%-bin}-server_linux completion zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}-server"
    $srcdir/${pkgname%-bin}-client_linux completion zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}-client"
}
