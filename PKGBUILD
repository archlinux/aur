pkgname=soh-bin
pkgver=9.1.0
pkgrel=1
scriptver=1.3
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('20d00d440c6d9d0580612aa62237424ae1135034a2e8ab907c67b845bc448f90')
sha256sums_x86_64=('b4f0cf5d98c07d9b818d499c74e3532cecd843a46d347950c3d593df81548565')
sha256sums_aarch64=('04e9134a208d1ddaf693582fc1f0822516de22bd6714a6c83c5ad761880623dd')
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
    #Lib fix to avoid updated lib issues in the future
    #find "$srcdir" -type f \( -name ".so" -o -name "*.so.*" \) -exec cp -r {} "$pkgdir/usr/lib/Shipwright" \;

    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/Shipwright"
    find "$srcdir" -type f -name "*.elf" -exec mv {} "$pkgdir/usr/share/games/Shipwright/soh" \;
    install -Dm755 "$srcdir/shipwright-$scriptver/soh" "$pkgdir/usr/bin/soh"
    install -Dm644 "$srcdir/shipwright-$scriptver/soh.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.desktop" "$pkgdir/usr/share/applications"
}
