# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>
# Upstream: Immersed Inc. <info at immersed dot com>

pkgname=immersed
pkgver=10.3.2
pkgrel=1

source_x86_64=( "https://static.immersed.com/dl/Immersed-x86_64.AppImage"
                "$pkgname.desktop")

sha256sums_x86_64=('6daa2bd8d3c2c479c1b8f09a5f2f1e2d00d76b0133e3cd19e0bce319f96c0aad'
                   SKIP)

pkgdesc="Immersed Desktop Agent"
arch=('x86_64')
url="https://immersed.com/"
license=('unknown')
depends=('fuse')
optdepends=('V4L2LOOPBACK-MODULE: Virtual webcam support')
options=(!strip !debug)

_appimage="Immersed-x86_64.AppImage"

prepare() {
    chmod +x "$srcdir/$_appimage"
    "$srcdir/$_appimage" --appimage-extract
}

package() {
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$pkgname/$_appimage"

    # Symlink executable
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$_appimage" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop entry
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/squashfs-root/Immersed.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
