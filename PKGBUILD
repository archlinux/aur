pkgname=nzportable-bin
pkgver=2.0.0indev20260920121224
pkgrel=1
scriptver=1.8
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'zenity')
makedepends=('unzip')
sha256sums=('f1a2513213abcdd03f2abab326c46ffc845299f0a4136f94a8ba7937ad8f17b3')
sha256sums_x86_64=('97aed5afca6b0c4665dc0d6ca32a41ba826db36d8d065d3662e95fb550ed0c0d')
sha256sums_i686=('05fac67f7fcc46374e34fb9a503db1fe887723eebaca4a9791a8fa2ba2e4e6d3')
sha256sums_aarch64=('5746108257d31e2da75a0cd301fb5ff7302e2c429fe7df1f4b38d397f7cf5f31')
sha256sums_armv7l=('79f839ca54f607060c1e7f502bd0b44b47639281529848e1dc889ae87d558e47')
                   
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
