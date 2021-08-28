# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=1.6.11
pkgrel=1
pkgdesc="A full-featured download manager (binary version)"
arch=('x86_64')
url="https://github.com/agalwood/Motrix"
license=('MIT')
conflicts=(
    'motrix'
    'motrix-git'
)
depends=(
    'gtk3'
    'libxcb'
    'nss'
)
source=(
    "https://github.com/agalwood/Motrix/releases/download/v${pkgver}/Motrix_${pkgver}_amd64.deb"
)
sha512sums=(
    '8393d02c92f482ef5834a7c5af86b3b816ac2699b1f4c0252f61c3867dc8988fe59774fc5ec009b3e4849922ffc8df428dfe9f697d229683469a1d2578350d11'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    # Link to the binary
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '/opt/Motrix/motrix' "$pkgdir/usr/bin/motrix"

    # SUID chrome-sandbox for electron 5+ as indicated here: https://github.com/electron/electron/issues/17972#issuecomment-487369441
    chmod 4755 "$pkgdir/opt/Motrix/chrome-sandbox"
}
