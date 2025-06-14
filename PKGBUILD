pkgname=twitter
_pkgname=Twitter
pkgver=1.0.7.aurpatch
pkgrel=2
pkgdesc="Unnofficial Twitter desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/twitterdesktop/application"
license=('GPL')
depends=('libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/twitterdesktop/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('2c790d15c8cf90063fa59d46114e1356f4658a600afc8b3034258218d471b2e3')


package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname-icon.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
