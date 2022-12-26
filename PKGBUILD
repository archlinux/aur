pkgname=netlify-application
_pkgname=Netlify
pkgver=1.0.6
pkgrel=3
pkgdesc="Unofficial Netlify desktop application"
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("https://gitlab.com/disneyplusdesktop/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')


package() {
    for dir in application-$pkgver-$pkgrel ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps" 
    cp -r "$pkgdir/opt/Netlify/netlify.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Netlify/netlify.sh" "$pkgdir/usr/bin/netlify"

    # Desktop Entry
    install -Dm644 "$srcdir/application/Netlify.desktop" \
        "$pkgdir/usr/share/applications/Netlify.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Netlify.desktop"
}
