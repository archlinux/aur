# Maintainer: noahlyk <noahlykins@gmail.com>
pkgname=krosshair
pkgver=0.4.0
pkgrel=1
pkgdesc="Crosshair overlay for games on linux using Vulkan"
arch=('x86_64' 'aarch64')
url="https://github.com/noahlyk/krosshair"
license=('GPL3')
depends=('vulkan-icd-loader' 'libgl' 'libx11')
makedepends=()
install=krosshair.install
options=('!debug')

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "krosshair-${pkgver}-linux-${_arch}.tar.gz::https://github.com/noahlyk/krosshair/releases/download/v${pkgver}/krosshair-linux-${_arch}.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/noahlyk/krosshair/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/krosshair.so" "$pkgdir/usr/lib/krosshair/krosshair.so"
    install -Dm644 "$srcdir/krosshair.json" "$pkgdir/usr/share/vulkan/implicit_layer.d/krosshair.json"
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/share/krosshair/crosshairs"
    cp -r "$srcdir/crosshairs/"* "$pkgdir/usr/share/krosshair/crosshairs/" 2>/dev/null || true
}
