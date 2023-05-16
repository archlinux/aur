pkgname=sliver-bin
pkgver=1.5.39
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('x86_64')
depends=()
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
install=
source_x86_64=("https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-client_linux" "https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-server_linux")
sha256sums_x86_64=('fd735c976b71fe21f1f35dca8977865e69e4bb3a49ffb7c64c65d3a235d237a4'
                   '142d3b96f2c42d4660afb05c725185377a58cf521667ed4efc360171ffcc2e97')

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
