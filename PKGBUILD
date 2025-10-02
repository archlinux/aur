pkgname=nzportable-bin
pkgver=2.0.0indev20250927071933
pkgrel=1
scriptver=1.0.6.1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
sha256sums=('1e12a4017f50ef12c7bf7b5e9603c7608b83fd3690ede4b88bf62d4ef85bd1c2')
sha256sums_x86_64=('9f4f25ac8db3c7ce8571de8481bb203dd8d8ab0a54512642a6d613a0fc95e3b3')
sha256sums_i686=('7e0b8b4ba6541a8fe1f820d83d9e8be523ac5f7d514e2d378fa0a7201384684d')
sha256sums_aarch64=('137ab4b5b60106a3efa91fa6e29ba7e831340b697c6dcc00e7ba222bfc9e1da1')
sha256sums_armv7l=('50f7db1ce8de0c03ed06cb5a53e3b39988d16ded9855997defe30b9ce77fe4fe')
                   
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
