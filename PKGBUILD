pkgname=sonicthehedgehog
_pkgname=SonicTheHedgehog
pkgver=1.0.0
pkgrel=1
pkgdesc="Sonic the Hedgehog game powered by the rsdkv4 engine."
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/SonicRSDK/sonicthehedgehog"
license=('GPL')
depends=('rsdkv4-bin' 'libogg' 'libvorbis' 'wget' 'sdl2' 'unzip' 'zenity')
makedepends=('unzip')
source=("https://gitlab.com/SonicRSDK/sonicthehedgehog/-/archive/$pkgver-$pkgrel/sonicthehedgehog-$pkgver-$pkgrel.tar.bz2" "https://archive.org/download/data_20231229_202312/Data.rsdk")
sha256sums=("SKIP" "SKIP")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    cd $srcdir/$pkgname-$pkgver-$pkgrel
    cp "$srcdir/$pkgname-$pkgver-$pkgrel/sonic.sh" "$pkgdir/usr/bin/sonic"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp "$srcdir/Data.rsdk" "$pkgdir/usr/share/games/$_pkgname"
    cp sonic.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
