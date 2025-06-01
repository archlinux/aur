pkgname=stan-desktop
_pkgname=Stan-desktop
pkgrlname=stan
_pkgrlname=Stan
pkgver=1.0.9.aurpatch.2
pkgrel=1
pkgdesc="Unnofficial Stan desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/stan-desktop"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('d6504f3bcfe21ff52a2362ea9a14d6e45c27d380b87ca12639aae0e24c663def')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgrlname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgrlname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgrlname"
    cp -r "$pkgdir/opt/$_pkgrlname/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/bin/electroncastlab" "/opt/$_pkgrlname/$pkgrlname"
    ln -s "/opt/$_pkgrlname/$pkgrlname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgrlname.desktop" \
        "$pkgdir/usr/share/applications/$pkgrlname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgrlname.desktop"
}
