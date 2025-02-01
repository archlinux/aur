pkgname=stan-desktop
_pkgname=Stan-desktop
pkgrlname=stan
_pkgrlname=Stan
pkgver=1.0.8
pkgrel=1
pkgdesc="Unnofficial Stan desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/stan-desktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('a7b4283c3cfc8eb7f97881759380c9af57b271d985d4693330451573063125e4')

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
    ln -s "/opt/$_pkgrlname/$pkgrlname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgrlname.desktop" \
        "$pkgdir/usr/share/applications/$pkgrlname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgrlname.desktop"
}
