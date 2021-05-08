# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot con>
# Contributor: Jack Chen <redchenjs@live.com>

pkgname=motrix-bin
pkgver=1.6.10
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
    '5ad7a3193dcff4a08ccb8a0fdb2d6db4ba6089e487db9b8e373a65770cf01accb3709941b97423c0c2cd3ced2be60970c8d91ba29cce7fc7317a4d28c3f2b853'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    # Link to the binary
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '/opt/Motrix/motrix' "$pkgdir/usr/bin/motrix"

    # SUID chrome-sandbox for electron 5+ as indicated here: https://github.com/electron/electron/issues/17972#issuecomment-487369441
    chmod 4755 "$pkgdir/opt/Motrix/chrome-sandbox"
}
