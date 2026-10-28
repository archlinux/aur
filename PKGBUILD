pkgname=nzportable-bin
pkgver=2.0.0indev20261022125425
pkgrel=1
scriptver=1.8
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'zenity')
makedepends=('unzip')
sha256sums=('f1a2513213abcdd03f2abab326c46ffc845299f0a4136f94a8ba7937ad8f17b3')
sha256sums_x86_64=('64814ab4b1f9d190250a936747d8ef5116d80eaf0804ead1adb73fda3ca5cbed')
sha256sums_i686=('0c3b7ccc53c83ccd2d598db0276057cba395a94a7a4171f2427ed36d41c6195f')
sha256sums_aarch64=('183952063d88cb42f494f82d2cd81346bad30ea489d3bf11f3de777b4c6da677')
sha256sums_armv7l=('003bce11b80e8928682e60cad6fda4ae543af4fd0e704df133875202a34830bb')
                   
source=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2")
source_x86_64=("nzportable-$pkgver-linux64.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")
source_i686=("nzportable-$pkgver-linux32.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")
source_aarch64=("nzportable-$pkgver-linuxarm64.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")
source_armv7l=("nzportable-$pkgver-linuxarmhf.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/NZP"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd "$srcdir"
    echo "$pkgver" > "$srcdir/version.txt"
    echo "$CARCH"
 
    cp -r "$srcdir/version.txt" "$pkgdir/usr/share/games/NZP"
    cp -r "$srcdir/nzp" "$pkgdir/usr/share/games/NZP"
    install -Dm755 "$srcdir/nzportable" "$pkgdir/usr/share/games/NZP/nzportable"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging-$scriptver/nzp" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging-$scriptver/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
