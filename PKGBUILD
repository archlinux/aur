pkgname=mfa2
_pkgname=MFA2
pkgver=2.72.0
pkgrel=2
pkgdesc="Fan made beat em up Marvel game created by ZVitor."
arch=('x86_64')
url="https://gitlab.com/linuxbombay/mfa2"
license=('GPL')
depends=('openbor-bin' 'git' 'sdl2' 'sdl2_gfx' 'wget')
makedepends=('unzip')
source=("git+https://gitlab.com/linuxbombay/mfa2.git")
sha256sums=("SKIP")

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/bin"
    
    # Packaging files
    FILE="/usr/share/games/$_pkgname/MFA2.pak"
     if test -f "$FILE"
    then
        echo "$FILE exists skipping download."
        mkdir "$pkgdir/usr/share/games/$_pkgname/Paks"
        ln -s /usr/share/games/$_pkgname/Paks/MFA2.pak "$pkgdir/usr/share/games/$_pkgname//Paks/MFA2.pak"
    else
        echo "$FILE does not exist, Starting download.."
        mkdir "$pkgdir/usr/share/games/$_pkgname/Paks"
        cd "$pkgdir/usr/share/games/$_pkgname/Paks"
        wget "https://archive.org/download/mfa-2/2.72.0/MFA2.pak"   
    fi
     cd "$srcdir/$pkgname"
     cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
     cp -r "$srcdir/$pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Link to binary
     install -Dm755 "$pkgdir/usr/share/games/$_pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
