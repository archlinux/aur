pkgname=kayo
_pkgname=Kayo
pkgver=1.0.2
pkgrel=1
pkgdesc="Unnofficial Kayo desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/kayo"
license=('GPL')
depends=('electron-castlab-bin' 'libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('15519ee2ed897393c32760bb9ad6d5de0188de1d9e4b0e3c111e65f2541bfdf2')


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
    ln -s "/usr/bin/electroncastlab" "$pkgdir/opt/$_pkgname/electron"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
