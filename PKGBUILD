pkgname=nzportable-bin
pkgver=2.0.0indev20250212072056
pkgrel=1
scriptver=1.0.6.1
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
sha256sums=('1e12a4017f50ef12c7bf7b5e9603c7608b83fd3690ede4b88bf62d4ef85bd1c2')
sha256sums_x86_64=('f900e3912196aca3f64a80dd093359a76eed0d804c159650be99e0f7d69141a7')
sha256sums_i686=('7607fef35d731df7d31dc1949aa52413e6abc59b1dcb5575e98440ed2a000744')
sha256sums_aarch64=('fcf5a29d62454140bd66827b04b2cc537c50ea3e36cf0a5738eeee80e4b6dd1d')
sha256sums_armv7l=('6a5b18b7299cf2d12c04b05c3453fc260afce264577c51b1df07a66e6b0397bc')
                   
source=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2")
source_x86_64=("https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")
source_i686=("https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")
source_aarch64=("https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")
source_armv7l=("https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")
noextract=('nzportable-linux64.zip' 'nzportable-linux32.zip' 'nzportable-linuxarm64.zip' 'nzportable-linuxarmhf.zip')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/NZP"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd "$srcdir"
    echo "$pkgver" > "$srcdir/version.txt"
    echo "$CARCH"
 
    cp -r "$srcdir/version.txt" "$pkgdir/usr/share/games/NZP"
    install -Dm755 *nzportable-*.zip "$pkgdir/usr/share/games/NZP"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging-$scriptver/nzp.sh" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging-$scriptver/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
