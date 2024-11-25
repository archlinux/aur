pkgname=mewe
_pkgname=Mewe
pkgver=1.0.5
pkgrel=1
pkgdesc="Unofficial Mewe desktop application."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/mewedesktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('2875814a71ef2546175a1e99c2e7195c16f44efbc78a6f883190c9b590505e31')


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"   
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary  
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
