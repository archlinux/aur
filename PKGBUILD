pkgname=mewe
_pkgname=Mewe
pkgver=1.0.8
pkgrel=1
pkgdesc="Unofficial Mewe desktop application."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/mewedesktop"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('994de70ce2f260e95ebebc5a85930d5f56b5568e55fb591350526127463dfd33')


package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/application-$pkgver"
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"   
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary  
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    ln -s /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
