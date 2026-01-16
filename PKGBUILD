pkgname=cloudfleet-cli
pkgver=0.8.19
pkgrel=1
pkgdesc="Cloudfleet CLI"
arch=('x86_64' 'aarch64')
license=('Custom')
url="https://cloudfleet.ai"
source=("cloudfleet_linux_amd64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_amd64.zip"
        "cloudfleet_linux_arm64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_arm64.zip")

sha256sums=('74169db780dbed3c6baa541e36b86e40dea12ace2d4933efe0663e2699a0d50a' '2ba9487f48c046205f509d88add9a32ce8fd0961677922e5176d99d444786e17')

prepare() {
    cd "$srcdir"
    # Extract only the archive for the current architecture
    case "$CARCH" in
        x86_64)
            bsdtar -xf "cloudfleet_linux_amd64-${pkgver}.zip"
            ;;
        aarch64)
            bsdtar -xf "cloudfleet_linux_arm64-${pkgver}.zip"
            ;;
    esac
}

package() {
    # Install binary
    install -Dm755 "$srcdir/cloudfleet" "$pkgdir/usr/bin/cloudfleet"
}
