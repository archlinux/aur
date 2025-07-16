pkgname=nzportable-bin
pkgver=2.0.0indev20250714073013
pkgrel=1
scriptver=1.0.6.1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
sha256sums=('1e12a4017f50ef12c7bf7b5e9603c7608b83fd3690ede4b88bf62d4ef85bd1c2')
sha256sums_x86_64=('66f52fe19c64a6d1249923655dbd7e4f3999b992f3a59b9898eba670437895eb')
sha256sums_i686=('99de72c456baad86f24c012b612ef18b640b204785aeaebbdb35c6cd16a09e2e')
sha256sums_aarch64=('2561f7deb2540151d7c30bec6dd08a5d5077c54c85ed4209bf41d5d0f384685c')
sha256sums_armv7l=('23ca00816b3a97d8badf2b50673322b1edf6767623653d7c4d07171341afd9b9')
                   
source=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2")
source_x86_64=("nzportable-$pkgver-linux64.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")
source_i686=("nzportable-$pkgver-linux32.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")
source_aarch64=("nzportable-$pkgver-linuxarm64.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")
source_armv7l=("nzportable-$pkgver-linuxarmhf.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")
noextract=('nzportable-$pkgver-linux64.zip' 'nzportable-$pkgver-linux32.zip' 'nzportable-$pkgver-linuxarm64.zip' 'nzportable-$pkgver-linuxarmhf.zip')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/NZP"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd "$srcdir"
    echo "$pkgver" > "$srcdir/version.txt"
    echo "$CARCH"
 
    cp -r "$srcdir/version.txt" "$pkgdir/usr/share/games/NZP"
    install -Dm755 *nzportable-*.zip "$pkgdir/usr/share/games/NZP/nzportable-$arch.zip"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging-$scriptver/nzp.sh" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging-$scriptver/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
