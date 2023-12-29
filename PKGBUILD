pkgname=sonicthehedgehog2
_pkgname=SonicTheHedgehog2
pkgver=1.0.2
pkgrel=1
pkgdesc="Sonic the Hedgehog 2 game powered by the rsdkv4 engine."
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/SonicRSDK/sonicthehedgehog2"
license=('GPL')
depends=('rsdkv4-bin' 'libogg' 'libvorbis' 'wget' 'sdl2' 'unzip' 'zenity')
makedepends=('unzip')
source=("https://gitlab.com/SonicRSDK/sonicthehedgehog2/-/archive/$pkgver-$pkgrel/sonicthehedgehog2-$pkgver-$pkgrel.tar.bz2" "https://archive.org/download/data_20231229/Data.rsdk")
sha256sums=("SKIP" "SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    cd $srcdir/sonicthehedgehog2-$pkgver-$pkgrel
    cp "$srcdir/sonicthehedgehog2-$pkgver-$pkgrel/sonic2.sh" "$pkgdir/usr/bin/sonic2"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp "$srcdir/Data.rsdk" "$pkgdir/usr/share/games/$_pkgname"
    cp sonic2.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/sonicthehedgehog2-$pkgver-$pkgrel/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
