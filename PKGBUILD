pkgname=mfa2
_pkgname=MFA2
pkgver=2.72.0
pkgrel=5
pkgdesc="Fan made beat em up Marvel game created by ZVitor."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/mfa2"
license=('GPL')
depends=('openbor-bin' 'git' 'sdl2' 'sdl2_gfx' 'wget')
makedepends=('unzip')
source=("git+https://gitlab.com/linuxbombay/mfa2/package.git"
"https://gitlab.com/linuxbombay/mfa2/pak/$pkgver/-/raw/main/mfa2.tar.xz")
sha256sums=('SKIP'
            'daa2ec4b5194617b4f9d24b03448e5a5001a6ed9774d4604f604c7609f7351f4')

package() {
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/bin"
    
    # Packaging files
     mkdir "$pkgdir/usr/share/games/$_pkgname/Paks"
     cp -r "$srcdir/MFA2.pak" "$pkgdir/usr/share/games/$_pkgname/Paks"
     #cd "$srcdir/package"
     cp -r "$srcdir/package/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Link to binary
     install -Dm755 "$srcdir/package/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
     install -Dm644 "$srcdir/package/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
