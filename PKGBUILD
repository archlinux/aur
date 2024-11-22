# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v3.0.8
pkgrel=4
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=('x86_64')
url="https://github.com/harilvfs/$_pkgname"
license=('Apache-2.0')
depends=('bash' 'gum' 'figlet' 'pacman' 'unzip' 'python')
source=(
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/scripts.zip"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/carch-gtk"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/carch-gtk.py"
    "https://github.com/harilvfs/$_pkgname/releases/download/$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/harilvfs/$_pkgname/refs/heads/main/$_pkgname.desktop"
)
sha256sums=(
    'SKIP' 
    '3efbb7d4863e06b609e48a2f26d1c823bfee7bf5388ef3262fa04d668917cd64' 
    'SKIP' 
    '47cef8973be3ff95c96b4a187c99fa29b43d7ac11b04786fcb479e99861d72be' 
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

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

