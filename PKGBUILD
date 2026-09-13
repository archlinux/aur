# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=usql-bin
pkgver=0.21.5
pkgrel=1
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

sha256sums=('38d64dd364ce4098818b92b5746e2bab1fd6630bca9981923791860ff9eaa8dd')
sha256sums_x86_64=('033823cce96e2f5f658cbe7120e375fce19430218d0a128c1f55c2d755b65edb')
sha256sums_armv6h=('04a6523fd95d91afca41a09f41db0f77ab9ffdaebddbf87bf2155dcabd660c73')
sha256sums_armv7h=('04a6523fd95d91afca41a09f41db0f77ab9ffdaebddbf87bf2155dcabd660c73')
sha256sums_aarch64=('b3b0f1a4b3788a573858b279588481e6c38ecd8a7137f38841becc3e4e3b7782')

check() {
    ./usql --version
}

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
