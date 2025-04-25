pkgname=sbsondemand
_pkgname=SBSonDemand
pkgver=1.0.2
pkgrel=1
pkgdesc="Unofficial SBS on Demand desktop app."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/linuxbombay/sbsondemand/"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('62f09d0de0233c951378ab41f77ec394e1ef036bdda6c3012e2d37d2d771ea37')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/application-$pkgver/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
