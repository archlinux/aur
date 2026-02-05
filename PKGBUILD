pkgname=soh-bin
pkgver=9.1.2
pkgrel=1
scriptver=1.3.1
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog' 'opusfile')
makedepends=('unzip')
sha256sums=('5fc9b80fef3c97e1347eb7f976786068d3ce4e4383810ea89bc4fe107a6b9b70')
sha256sums_x86_64=('b8a7ad2c1e779a9a025841f160b354e2def85049ce6f49e09516e6a9fa4bc69f')
sha256sums_aarch64=('c601c24075a37114a968f4d3ad6b8e807062e37a627df338c2bc70c7e5410bcc')
source=("https://gitlab.com/linuxbombay/soh/shipwright/-/archive/$scriptver/shipwright-$scriptver.tar.bz2")
source_x86_64=("shipwright-$pkgver-linux-x64.zip::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/shipwright-linux-x64.zip")
source_aarch64=("shipwright-$pkgver-linux-arm64.zip::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/shipwright-linux-arm64.zip")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/Shipwright"
    install -dm755 "$pkgdir/usr/share/games/Shipwright"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "*.o2r" -o -name "*.txt" \) -exec cp -r {} "$pkgdir/usr/share/games/Shipwright" \;
    cp -r "$srcdir/usr/lib/Shipwright" "$pkgdir/usr/lib/"
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/Shipwright"
    find "$srcdir" -type f -name "*.elf" -exec mv {} "$pkgdir/usr/share/games/Shipwright/soh" \;
    install -Dm755 "$srcdir/shipwright-$scriptver/soh" "$pkgdir/usr/bin/soh"
    install -Dm644 "$srcdir/shipwright-$scriptver/soh.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.desktop" "$pkgdir/usr/share/applications"
}
