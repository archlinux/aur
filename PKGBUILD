pkgname=primevideos-bin
_pkgname=PrimeVideos-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Prime Videos desktop application"
arch=('x86_64')
url="https://gitlab.com/primevideos"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("primevideos-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/d6838/binaries/"$pkgver"-"$pkgrel"/-/raw/main/DisneyPlus-linux-x64.tar.gz")

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
    install -Dm644 "$srcdir/$_pkgname/Disneyplus.desktop" \
        "$pkgdir/usr/share/applications/Disneyplus.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Disneyplus.desktop"
}
