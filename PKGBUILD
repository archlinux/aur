pkgname=netflix-bin
_pkgname=Netflix-bin
pkgver=1.0.3
pkgrel=3
_pkgrel_x86_64=1
pkgdesc="Unnofficial FoxtelGo desktop application"
arch=('x86_64')
url="https://gitlab.com/netflix-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("netflix-git")
sha256sums_x86_64=('SKIP')
source_x86_64=("https://gitlab.com/netflix-desktop/binaries/"$pkgver"-"$pkgrel"/-/raw/main/Netflix-linux-x64.tar.gz")

package() {
    for dir in Netflix-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/Netflix"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/Netflix"
    cp -r "$pkgdir/opt/Netflix/netflix.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/Netflix/Netflix" "$pkgdir/usr/bin/netflix"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/Netflix.desktop" \
        "$pkgdir/usr/share/applications/Netflix.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/Netflix.desktop"
}
