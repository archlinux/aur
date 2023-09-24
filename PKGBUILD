pkgname=ruffle-arm
pkgver=2023.08.31
pkgrel=2
pkgdesc="Ruffle Flash Emulator for Arm64"
arch=('aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(gtk3 libxcb zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle-git ruffle-bin)
sha256sums=('SKIP')
source=("https://gitlab.com/ruffle-arm/binaries/ruffle-$pkgver-arm64/-/raw/main/ruffle-$pkgver-arm64.tar.xz")

package() {
    for dir in ruffle-*/ ; do mv "${dir}" "$pkgname" ;done
    cd $pkgname
    install -dm755 "$pkgdir/usr/bin"
    cp -r ./ruffle_desktop $pkgdir/usr/bin/ruffle
    
    # Desktop Entry
    install -dm755 "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/$pkgname/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$srcdir/$pkgname/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
