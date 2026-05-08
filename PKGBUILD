# Maintainer: Junjie <junjie@omni-stream.ai>
pkgname=omni-code-bridge-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Rust bridge for Omni Code — connects mobile clients to local coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/omni-stream-ai/omni-code-bridge"
license=('MIT')
depends=('gcc-libs')
provides=('omni-code-bridge')
conflicts=('omni-code-bridge')
source=("omni-code-bridge.service"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/omni-stream-ai/omni-code-bridge/v${pkgver}/LICENSE")
source_x86_64=("omni-code-bridge-$pkgver-linux-x64.tar.gz::https://github.com/omni-stream-ai/omni-code-bridge/releases/download/v${pkgver}/omni-code-bridge-linux-x64.tar.gz")
source_aarch64=("omni-code-bridge-$pkgver-linux-arm64.tar.gz::https://github.com/omni-stream-ai/omni-code-bridge/releases/download/v${pkgver}/omni-code-bridge-linux-arm64.tar.gz")
sha256sums=('SKIP'
            'ed59c1da82265d3d408c7c47ebdfd1af041ab847e68692387189487dc60a9713')
sha256sums_x86_64=('705a154745aedc32af81dad1d6de0d460a45bd9274998022fb09dcb47d4f62b7')
sha256sums_aarch64=('55dad39ee653b905f91c206787a602f3ed1ee3cdb5eede1a0025447849f50ed8')

package() {
    local asset_dir
    case "$CARCH" in
        x86_64) asset_dir="omni-code-bridge-linux-x64" ;;
        aarch64) asset_dir="omni-code-bridge-linux-arm64" ;;
        *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
    esac

    install -Dm755 "$asset_dir/omni-code-bridge" "$pkgdir/usr/bin/omni-code-bridge"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/omni-code-bridge.service" "$pkgdir/usr/lib/systemd/user/omni-code-bridge.service"
}
