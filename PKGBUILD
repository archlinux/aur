# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Upstream: Immersed Inc. <info at immersed dot com>

pkgname=immersed
pkgver=9.10
pkgrel=1

source_x86_64=( "https://static.immersed.com/dl/Immersed-x86_64.AppImage"
                "$pkgname.desktop")

sha256sums_x86_64=('331f149d5e1f65279b8fd6a1eb9d19aac2ff10826933a8e5f2d6265c96622690'
                   SKIP)

pkgdesc="Immersed Desktop Agent"
arch=('x86_64')
url="https://immersed.com/"
license=('unknown')
depends=('fuse')
optdepends=('V4L2LOOPBACK-MODULE: Virtual webcam support')
options=(!strip)

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
