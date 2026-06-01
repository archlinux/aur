pkgname=netflix
_pkgname=Netflix
pkgver=1.1.2
pkgrel=2
pkgdesc="Unnofficial Netflix desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/netflix-desktop"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('79c9ae346e167fa36c4069cfc55b5bf4b7a0e816197c17701efefc77a4d4ff05')


package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/usr/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
