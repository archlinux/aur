pkgname=netlify-application
_pkgname=Netlify
pkgrlname=netlify
pkgver=1.1.1
pkgrel=1
pkgdesc="Unofficial Netlify desktop application"
arch=('x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/netlify-desktop//application"
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('368c2e8388e670c6067a76859649a9d83a72447220c7da8612f741176bf4e2eb')


package() {
    for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgrlname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps" 
    cp -r "$pkgdir/opt/Netlify/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Netlify/$pkgrlname.sh" "$pkgdir/usr/bin/$pkgrlname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
