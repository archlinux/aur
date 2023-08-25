pkgname=sliver-bin
pkgver=1.5.41
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
sha256sums_x86_64=('afeb282bb991650ada2e73c65ed5a1770e1a3bc415b2e1e07462b854c077c93d'
                   'ce75590d1d79bc808d98b70ec03355d1117ca54c3b49b6ba474aa704ea9a6c2e')

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
