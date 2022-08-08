pkgname=7plus-bin
_pkgname=7Plus-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Unofficial 7Plus desktop application."
arch=('x86_64' 'arm7h' 'aarch64')
url="hhttps://gitlab.com/7plus"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("7plus-git")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
source_x86_64=("https://gitlab.com/7plus/binaries/"$pkgver"-"$pkgrel"/-/raw/main/7Plus-linux-x64.tar.xz")
source_armv7h=("https://gitlab.com/7plus/binaries/"$pkgver"-"$pkgrel"/-/raw/main/7Plus-linux-armv7l.tar.xz")
source_aarch64=("https://gitlab.com/7plus/binaries/"$pkgver"-"$pkgrel"/-/raw/main/7Plus-linux-arm64.tar.xz")

package() {
    for dir in 7Plus-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/7Plus"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/7Plus"
    cp -r "$pkgdir/opt/7Plus/resources/app/7plus.svg" "$pkgdir/usr/share/pixmaps"     


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/7Plus" "$pkgdir/usr/bin/7Plus"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/7Plus.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}