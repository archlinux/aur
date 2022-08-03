pkgname=disneyplus-bin
_pkgname=DisneyPlus-bin
pkgver=1.0.2
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Disney+ desktop application"
arch=('x86_64')
url="https://gitlab.com/d6838/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("disneyplus-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/d6838/binaries/"$pkgver"-"$pkgrel"/-/raw/main/DisneyPlus-linux-x64.tar.xz")

package() {
    for dir in DisneyPlus-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/DisneyPlus"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/DisneyPlus"
    cp -r "$pkgdir/opt/DisneyPlus/disneyplus.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/DisneyPlus/disneyplus" "$pkgdir/usr/bin/disneyplus"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/DisneyPlus.desktop" \
        "$pkgdir/usr/share/applications/DisneyPlus.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/DisneyPlus.desktop"
}
