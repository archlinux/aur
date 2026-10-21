pkgname=nzportable-bin
pkgver=2.0.0indev20261020123927
pkgrel=1
scriptver=1.8
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'zenity')
makedepends=('unzip')
sha256sums=('f1a2513213abcdd03f2abab326c46ffc845299f0a4136f94a8ba7937ad8f17b3')
sha256sums_x86_64=('c42b613311be3feb58c7534fe67bed8c93f7d2406108a566cb2042eecd0d899d')
sha256sums_i686=('eca2e4898c34226fc792bb9ecb76b73f452ad65a68aa03d2d4a04e34e51f0232')
sha256sums_aarch64=('9aa1e132dc3da8c0f7bd09eca3b10060d0f2ed9695087031556b79428ae9c649')
sha256sums_armv7l=('50590df84d90bd1317073991bc16e3076528d6afee2b958f160482a2cfb3c1ba')
                   
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
