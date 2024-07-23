pkgname=netlify-application
_pkgname=Netlify
pkgrlname=netlify
pkgver=1.1.2
pkgrel=1
pkgdesc="Unofficial Netlify desktop application"
arch=('x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/netlify-desktop//application"
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('119aacde89282a5abe258894cdec380c4cb014fd3f205dd7d2e5de13ab17da31')


package() {
    for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgrlname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps" 
    cp -r "$pkgdir/opt/Netlify/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Netlify/$pkgrlname" "$pkgdir/usr/bin/$pkgrlname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$pkgrlname.desktop" \
        "$pkgdir/usr/share/applications/$pkgrlname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgrlname.desktop"
}
