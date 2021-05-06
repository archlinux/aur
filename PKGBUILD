# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot con>
# Contributor: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=1.6.8
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
    '1c9116b375dffcf551daf0bbde1cea8edc6dedf12eccac288394bd8bcc7272db8f718f4b46184e60b171c93b4444633c36650e887131b50ebfb058bd5076d0df'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    # Link to the binary
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '/opt/Motrix/motrix' "$pkgdir/usr/bin/motrix"

    # SUID chrome-sandbox for electron 5+ as indicated here: https://github.com/electron/electron/issues/17972#issuecomment-487369441
    chmod 4755 "$pkgdir/opt/Motrix/chrome-sandbox"
}
