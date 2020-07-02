# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=v1.5.15
_pkgver=1.5.15
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
)
source=(
    "https://github.com/agalwood/Motrix/releases/download/${pkgver}/Motrix_${_pkgver}_amd64.deb"
)
sha512sums=(
    'f20d2c9a22de21e57d4f444f320a76ef1e98ba48caef6ff0634e6f9ea69c29b156760e61030317e875423e52249a87cf1be80803166134a62e5f6856d34970a8'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    # Link to the binary
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '/opt/Motrix/motrix' "$pkgdir/usr/bin/motrix"

    # SUID chrome-sandbox for Electron 5+
    chmod 4755 "$pkgdir/opt/Motrix/chrome-sandbox"
}
