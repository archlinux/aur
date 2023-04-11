pkgname=mfa2
_pkgname=MFA2
pkgver=2.72.0
pkgrel=1
pkgdesc="Fan made beat em up Marvel game created by ZVitor."
arch=('x86_64')
url="https://gamejolt.com/games/marvel-first-alliance-2/18690"
license=('GPL')
depends=('openbor-bin' 'git' 'sdl2' 'sdl2_gfx' 'unzip')
makedepends=('unzip')
source=("git+https://gitlab.com/openbor-game-archive/mfa2.git")
sha256sums=("SKIP")

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
     cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
     cp -r "$srcdir/$pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
