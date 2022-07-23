pkgname=binge-bin
_pkgname=Binge-bin
pkgver=1.0.3
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Binge desktop application"
arch=('x86_64')
url="https://gitlab.com/binge-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("binge-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/binge-desktop/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Binge-linux-x64.tar.xz")

package() {
    for dir in Binge-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Binge"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Binge"
    cp -r "$pkgdir/opt/Binge/binge.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Binge/binge" "$pkgdir/usr/bin/binge"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/Binge.desktop" \
        "$pkgdir/usr/share/applications/Binge.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Binge.desktop"
}
