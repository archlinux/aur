# Maintainer: Junjie <junjie@omni-stream.ai>
pkgname=omni-code-bridge-bin
pkgver=0.7.1
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
sha256sums_x86_64=('a0ced2381daf6e8ac4397eaa0f538a92ec1783fe144ef494afcb6d429a76021e')
sha256sums_aarch64=('c22338170ca043958eb49aa5cba04a0456479579d30fb99b8cc4b5c1dd11067f')

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
