pkgname=googlekeep-bin
_pkgname=GoogleKeep-bin
pkgver=1.0.2
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Unofficial Google Keep desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/googlekeep-desktop/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("googlekeep-git")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/googlekeep-desktop/binaries/$pkgver-$pkgrel/-/raw/main/GoogleKeep-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/googlekeep-desktop/binaries/$pkgver-$pkgrel/-/raw/main/GoogleKeep-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/googlekeep-desktop/binaries/$pkgver-$pkgrel/-/raw/main/GoogleKeep-linux-arm64.tar.gz")

package() {
    for dir in GoogleKeep-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/GoogleKeep"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/GoogleKeep"
    cp -r "$pkgdir/opt/Youtube/resources/app/googlekeep.svg" "$pkgdir/usr/share/pixmaps" 


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/GoogleKeep/GoogleKeep" "$pkgdir/usr/bin/googlekeep"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/GoogleKeep.desktop" \
        "$pkgdir/usr/share/applications/GoogleKeep.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/GoogleKeep.desktop"
}
