# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=usql-bin
pkgver=0.21.4
pkgrel=2
pkgdesc='A universal command-line interface for SQL databases'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/usql"
license=(MIT)
provides=(usql)
conflicts=(usql)

source=("https://raw.githubusercontent.com/xo/usql/refs/tags/v$pkgver/README.md")
source_x86_64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-amd64.tar.bz2")
source_armv6h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_armv7h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_aarch64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm64.tar.bz2")

sha256sums=('aa6b75df1c4acc895646dfba859d93df9d5dbfec94eccbeae513ef93665d5780')
sha256sums_x86_64=('78bd9b221e223d7a954d41f51e9eca98bdd94b401618367ba0f3887abebd44fc')
sha256sums_armv6h=('d9359d9688dfa0e7111802acc9b9b5cadd42fed48c382c5c8191417f561e9108')
sha256sums_armv7h=('d9359d9688dfa0e7111802acc9b9b5cadd42fed48c382c5c8191417f561e9108')
sha256sums_aarch64=('ccad89d6f4c67a9bf595df0aa8a550e0a9e3d6a6f9356356ba1e164e311335e4')

package() {
    install -Dm755 usql -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/usql" --completion-script-bash > "${pkgdir}/usr/share/bash-completion/completions/usql"
    "${pkgdir}/usr/bin/usql" --completion-script-zsh > "${pkgdir}/usr/share/zsh/site-functions/_usql"
    "${pkgdir}/usr/bin/usql" --completion-script-fish > "${pkgdir}/usr/share/fish/vendor_completions.d/usql.fish"
}
