pkgname=nzportable-bin
pkgver=2.0.0indev20250304072246
pkgrel=1
scriptver=1.0.6.1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
sha256sums=('1e12a4017f50ef12c7bf7b5e9603c7608b83fd3690ede4b88bf62d4ef85bd1c2')
sha256sums_x86_64=('2f5b5164e03ff3dce1975bc751ebb16997605beab015d9285123a717e015295d')
sha256sums_i686=('76787a26560802957396f827d41077d69bfd57dd525c44f760fbb7681e70c1a0')
sha256sums_aarch64=('6db73c9cdeef0f7195fc590a42d5713181c47552c84a1397f67fef0403d62c5a')
sha256sums_armv7l=('ecd45bbb3b3e189b9dd59a76de57d782590f005e1074f5c4d2c715d99c9b1e4e')
                   
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
