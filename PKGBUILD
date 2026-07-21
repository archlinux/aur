# Maintainer: Keyaruga <keyaruga333@gmail.com>

pkgname=aether-proxy-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="User-space proxy client for tunneling traffic through filtered networks via a local SOCKS5 proxy"
arch=('x86_64' 'aarch64' 'armv7h')

url="https://github.com/CluvexStudio/Aether"
license=('AGPL-3.0-only')

case "$CARCH" in
    x86_64)
        _aether_arch="x86_64"
        _sha256='45a239526267690c4c3345d50a0eef9ba7ded99cc40a3c05cea713ec9ae18c57'
        ;;
    aarch64)
        _aether_arch="arm64"
        _sha256='344552f1b5ade7124ae09e4181546b35ac346af31d82629a39e1de7e59b90cfd'
        ;;
    armv7h)
        _aether_arch="armv7"
        _sha256='d0d52de3676000871939a9635b9bb262d7d43789703d19ba014a3097e034f744'
        ;;
esac

source=(
    "aether-linux-${_aether_arch}.tar.gz::https://github.com/CluvexStudio/Aether/releases/download/v${pkgver}/aether-linux-${_aether_arch}.tar.gz"
    "aether-wrapper"
    "LICENSE::https://raw.githubusercontent.com/CluvexStudio/Aether/v${pkgver}/LICENSE"
)

sha256sums=(
    "$_sha256"
    'SKIP'
    '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
)

package() {
    install -Dm755 \
        "$srcdir/aether" \
        "$pkgdir/usr/lib/aether/aether"

    install -Dm755 \
        "$srcdir/aether-wrapper" \
        "$pkgdir/usr/bin/aether"

    install -Dm644 \
        "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
