# Maintainer: RadioLogic
pkgname=sliver
pkgver=1.5.43
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('any')
depends=()
makedepends=('go>=1.18' 'make' 'sed' 'tar' 'curl' 'zip' 'unzip' 'git' 'which')
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname}")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BishopFox/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('272f69ae75c93961c16460d0a692b12161831952c347f0a67972b09c8adc6fbd')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/${pkgname}-${pkgver}/${pkgname}-server" "$pkgdir/usr/bin/${pkgname}-server"
    install -m755 "$srcdir/${pkgname}-${pkgver}/${pkgname}-client" "$pkgdir/usr/bin/${pkgname}-client"

    # Making completions
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    $srcdir/${pkgname}-${pkgver}/${pkgname}-server completion bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname}-server"
    $srcdir/${pkgname}-${pkgver}/${pkgname}-client completion bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname}-client"

    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    $srcdir/${pkgname}-${pkgver}/${pkgname}-server completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}-server.fish"
    $srcdir/${pkgname}-${pkgver}/${pkgname}-client completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}-client.fish"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    $srcdir/${pkgname}-${pkgver}/${pkgname}-server completion zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname}-server"
    $srcdir/${pkgname}-${pkgver}/${pkgname}-client completion zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname}-client"
}
