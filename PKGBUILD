pkgname=foxtelgo-bin
_pkgname=FoxtelGo-bin
pkgver=1.0.5
pkgrel=3
_pkgrel_x86_64=1
pkgdesc="Unnofficial FoxtelGo desktop application"
arch=('x86_64')
url="https://gitlab.com/foxtelgo/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("foxtelgo-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/foxtelgo/binaries/"$pkgver"-"$pkgrel"/-/raw/main/FoxtelGo-linux-x64.tar.xz")
                

package() {
    mv FoxtelGo-linux-x64 $_pkgname  
    cd $_pkgname
    install -dm755 "$pkgdir/opt/FoxtelGo"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/FoxtelGo"
    cp -r "$pkgdir/opt/FoxtelGo/foxtelgo.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/FoxtelGo/foxtelgo" "$pkgdir/usr/bin/foxtelgo"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/FoxtelGo.desktop" \
        "$pkgdir/usr/share/applications/FoxtelGo.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/FoxtelGo.desktop"
}
