pkgname=soh-bin
pkgver=9.0.0
pkgrel=1
scriptver=1.2
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('867be3fc33d28aa2819dfdfdf10706b4ecdab7dc837c9295b025f5f60fddb3d2')
sha256sums_x86_64=('510c1c475b77a663905abb8130a942a2f3bd008f5aab1a85211676848705b935')
sha256sums_aarch64=('2bc4c9f97ad0061f34e1630eb044d1abea6d7701a6090d1f455ee9fe4d8068c8')
source=("https://gitlab.com/linuxbombay/soh/shipwright/-/archive/$scriptver/shipwright-$scriptver.tar.bz2")
source_x86_64=("shipwright-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/shipwright-linux-x64.tar.xz")
source_aarch64=("shipwright-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/shipwright-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/Shipwright"
    install -dm755 "$pkgdir/usr/share/games/Shipwright"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "soh" -o -name "*.ini" -o -name "*.json" -o -name "*.otr" \) -exec cp -r {} "$pkgdir/usr/share/games/Shipwright" \;
    #Lib fix to avoid updated lib issues in the future
    find "$srcdir" -type f \( -name ".so" -o -name "*.so.*" \) -exec cp -r {} "$pkgdir/usr/lib/Shipwright" \;

    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/Shipwright"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.sh" "$pkgdir/usr/bin/soh"
    install -Dm644 "$srcdir/shipwright-$scriptver/soh.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.desktop" "$pkgdir/usr/share/applications"
}
