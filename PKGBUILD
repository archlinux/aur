pkgname=netlify-application
_pkgname=Netlify
pkgrlname=netlify
pkgver=1.1.5
pkgrel=1
pkgdesc="Unofficial Netlify desktop application"
arch=('x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/netlify-desktop//application"
depends=('libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('a39fddf8d55b0ae7dbc756d273600d1a2630a303eac6ba8a59bb7d4bb59afd34')


package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgrlname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps" 
    cp -r "$pkgdir/opt/Netlify/$pkgrlname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/Netlify/$pkgrlname" "$pkgdir/usr/bin/$pkgrlname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgrlname.desktop" \
        "$pkgdir/usr/share/applications/$pkgrlname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgrlname.desktop"
}
