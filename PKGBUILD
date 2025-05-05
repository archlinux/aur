pkgname=primevideo
_pkgname=PrimeVideo
pkgver=1.0.6
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Prime Videos desktop application"
arch=('x86_64')
url="https://gitlab.com/primevideo/application"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("https://gitlab.com/primevideo/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('5ef4dec50916d93732bc0ba805121993bcef79996c67830f5bcdd853275a20c1')

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
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
