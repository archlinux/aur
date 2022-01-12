pkgname=foxtelgo-bin
_pkgname=FoxtelGo-bin
pkgver=1.0.3
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial FoxtelGo desktop application"
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/foxtelgo/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("foxtelgo-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/foxtelgo/binaries/"$pkgver"-"$pkgrel"/-/raw/main/FoxtelGo-linux-x64.tar.gz")

package() {
    for dir in FoxtelGo-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/FoxtelGo"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/FoxtelGo"
    cp -r "$pkgdir/opt/FoxtelGo/foxtelgo.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/FoxtelGo/FoxtelGo" "$pkgdir/usr/bin/foxtelgo"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/FoxtelGO.desktop" \
        "$pkgdir/usr/share/applications/FoxtelGO.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/FoxtelGO.desktop"
}
