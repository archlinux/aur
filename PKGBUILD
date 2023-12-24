# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Upstream: Immersed Inc. <info at immersed dot com>

pkgname=immersed
pkgver=10.0
pkgrel=1

_appimage="Immersed-x86_64.AppImage"

source_x86_64=( "$_appimage::https://static.immersed.com/dl/Immersed-x86_64.AppImage"
                "$pkgname.desktop")

sha256sums_x86_64=('a3fde755e3b048c148f4484704a78ddecb3c05f9ac7bd2cc21e82b77dbfb523e'
                   SKIP)

pkgdesc="Immersed Desktop Agent"
arch=('x86_64')
url="https://immersed.com/"
license=('unknown')
depends=('fuse')
optdepends=('V4L2LOOPBACK-MODULE: Virtual webcam support')
options=(!strip)
noextract=("$_appimage")

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
