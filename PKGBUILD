# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=usql-bin
pkgver=0.21.6
pkgrel=1
pkgdesc='A universal command-line interface for SQL databases'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/usql"
license=(MIT)
provides=(usql)
conflicts=(usql)

source=("$pkgname-$pkgver-README.md::https://raw.githubusercontent.com/xo/usql/refs/tags/v$pkgver/README.md")
source_x86_64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-amd64.tar.bz2")
source_armv6h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_armv7h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_aarch64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm64.tar.bz2")

sha256sums=('38d64dd364ce4098818b92b5746e2bab1fd6630bca9981923791860ff9eaa8dd')
sha256sums_x86_64=('b3046140f8f2add0e2afaaa595b824d445e933d400a00d50a1c038760d4ce13c')
sha256sums_armv6h=('1fb54b57ecf27d0ff1f64b535bee991f32e5df6ebe7efbc55d85abac5a15dae0')
sha256sums_armv7h=('1fb54b57ecf27d0ff1f64b535bee991f32e5df6ebe7efbc55d85abac5a15dae0')
sha256sums_aarch64=('52bb8a1b9d1643ccdb79348d63626b75694d9fd3667b3f62f97f43cf51be0bab')

check() {
    ./usql --version
}

package() {
    install -Dm755 usql -t "$pkgdir/usr/bin"
    install -Dm644 "$pkgname-$pkgver-README.md" -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/usql" --completion-script-bash > "${pkgdir}/usr/share/bash-completion/completions/usql"
    "${pkgdir}/usr/bin/usql" --completion-script-zsh > "${pkgdir}/usr/share/zsh/site-functions/_usql"
    "${pkgdir}/usr/bin/usql" --completion-script-fish > "${pkgdir}/usr/share/fish/vendor_completions.d/usql.fish"
}
