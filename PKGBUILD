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
sha256sums_x86_64=('ebbbb72af584940ff9866ce79441beafc49bb433c3e6b306d3f5c57fe3e589c1')
sha256sums_aarch64=('e452a769cd930ba32fa0cb2a5c030fde6c65e1afbdf7448214ee278ceae992c6')
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
