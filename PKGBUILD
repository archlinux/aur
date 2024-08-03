pkgname=paramountplus
_pkgname=ParamountPlus
pkgver=1.0.5
pkgrel=1
pkgdesc="Unnofficial ParamountPlus desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/paramountplus"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
conflicts=("ParamountPlus-bin")
replace=("ParamountPlus-bin")
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('41baea19199a34288e20dca6f7e6c5aa62795a9a9f4bd5ff77e735263901e544')

package() {
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
