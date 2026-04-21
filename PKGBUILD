# Maintainer: fibsussy <noahlykins@gmail.com>
pkgname=krosshair
pkgver=0.1.2
pkgrel=1
pkgdesc="Crosshair overlay for games on linux using Vulkan"
arch=('x86_64' 'aarch64')
url="https://github.com/fibsussy/krosshair"
license=('GPL3')
depends=('vulkan-icd-loader' 'libgl' 'libx11')
makedepends=()
options=('!debug')

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "https://github.com/fibsussy/krosshair/releases/download/v${pkgver}/krosshair-linux-${_arch}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fibsussy/krosshair/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/krosshair.so" "$pkgdir/usr/lib/krosshair/krosshair.so"
    install -Dm644 "$srcdir/krosshair.json" "$pkgdir/usr/share/vulkan/implicit_layer.d/krosshair.json"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}