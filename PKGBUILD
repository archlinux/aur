pkgname=stan-bin
_pkgname=Stan-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial Stan desktop application"
arch=('x86_64')
url="https://gitlab.com/Stan-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("stan-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/stan-desktop/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Stan-linux-x64.tar.gz")

package() {
    for dir in Stan-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Stan"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Stan"
    cp -r "$pkgdir/opt/Stan/stan.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Stan/stan" "$pkgdir/usr/bin/stan"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/Stan.desktop" \
        "$pkgdir/usr/share/applications/Stan.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Stan.desktop"
}
