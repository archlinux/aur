pkgname=crunchyroll-bin
_pkgname=Crunchyroll-bin
pkgver=1.0.1
pkgrel=1
_pkgrel_x86_64=1
pkgdesc="Unnofficial CrunchyRoll desktop application"
arch=('x86_64')
url="https://gitlab.com/crunchyroll/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("crunchyroll-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/crunchyroll/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Crunchyroll-linux-x64.tar.xz")

package() {
    for dir in Crunchyroll-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Crunchyroll"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Crunchyroll"
    cp -r "$pkgdir/opt/Crunchyroll/crunchyroll.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Crunchyroll/crunchyroll" "$pkgdir/usr/bin/crunchyroll"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/Crunchyroll.desktop" \
        "$pkgdir/usr/share/applications/Crunchyroll.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Crunchyroll.desktop"
}