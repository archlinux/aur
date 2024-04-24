pkgname=sliver-bin
pkgver=1.5.42
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('x86_64')
depends=()
makedepends=('coreutils')
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
install=
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-client::https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-client_linux"
    "${pkgname%-bin}-${pkgver}-server::https://github.com/BishopFox/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-server_linux"
)
sha256sums_x86_64=('c53bc13170b9ff26b0cca93715e947318e06cafe0d98cf825eabffe3c7f763cb'
                   '2ce6ab2d48d613830f2cd7920ced86ca7b6782dbafe64af84ba476f71d08620e')

package() {
    install -Dm755 "$srcdir/${pkgname%-bin}-${pkgver}-server" "$pkgdir/usr/bin/${pkgname%-bin}-server"
    install -Dm755 "$srcdir/${pkgname%-bin}-${pkgver}-client" "$pkgdir/usr/bin/${pkgname%-bin}-client"

    # Making completions
    chmod +x "$srcdir/${pkgname%-bin}-${pkgver}-server" "$srcdir/${pkgname%-bin}-${pkgver}-client"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
    $srcdir/${pkgname%-bin}-${pkgver}-server completion bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}-server"
    $srcdir/${pkgname%-bin}-${pkgver}-client completion bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}-client"

    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d/"
    $srcdir/${pkgname%-bin}-${pkgver}-server completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-bin}-server.fish"
    $srcdir/${pkgname%-bin}-${pkgver}-client completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-bin}-client.fish"

    install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
    $srcdir/${pkgname%-bin}-${pkgver}-server completion zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}-server"
    $srcdir/${pkgname%-bin}-${pkgver}-client completion zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}-client"
}
