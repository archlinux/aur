# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v3.0.8
pkgrel=4
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=('x86_64')
url="https://github.com/harilvfs/$_pkgname"
license=('Apache-2.0')
depends=('bash' 'gum' 'figlet' 'pacman' 'unzip' 'python' 'gtk3')
source=(
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/scripts.zip"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/carch-gtk"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/carch-gtk.py"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/$_pkgname"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/carchcli"
    "https://raw.githubusercontent.com/harilvfs/$_pkgname/refs/heads/main/$_pkgname.desktop"
)
sha256sums=(
    'SKIP' 
    '3efbb7d4863e06b609e48a2f26d1c823bfee7bf5388ef3262fa04d668917cd64' 
    'SKIP' 
    'adf48404dd619f0fc58c12352d732c27f4c95c96446d69b1652394e82d44eb7b' 
    '865621815bce71fca88d3c5251149673d20936656b71fe69510fed594384acc8'
    'SKIP' 
)

conflicts=($_pkgname)
provides=($_pkgname)

prepare() {
    echo "Version=$pkgver" >> "$srcdir/$_pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/bin/scripts"

    unzip "$srcdir/scripts.zip" -d "$pkgdir/usr/bin/scripts"

    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm755 "$srcdir/carch-gtk" "$pkgdir/usr/bin/carch-gtk"
    install -Dm755 "$srcdir/carch-gtk.py" "$pkgdir/usr/bin/carch-gtk.py"

    install -Dm755 "$srcdir/carchcli" "$pkgdir/usr/bin/carchcli"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

