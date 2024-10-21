pkgname=sonicthehedgehog
_pkgname=SonicTheHedgehog
pkgver=1.0.2
pkgrel=1
pkgdesc="Sonic the Hedgehog game powered by the rsdkv4 engine."
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/sonicthehedgehog"
license=('GPL')
depends=('rsdkv4-bin' 'libogg' 'libvorbis' 'wget' 'sdl2' 'unzip' 'yad')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/sonicthehedgehog/-/archive/$pkgver/sonicthehedgehog-$pkgver.tar")
sha256sums=('ecdfdb6f523dbda9b21aa31a4f048063b8a1bc21f092dd8497f44803088c7c3f')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
       
    cd $srcdir/$pkgname-$pkgver
    cp "$srcdir/$pkgname-$pkgver/sonic.sh" "$pkgdir/usr/bin/sonic"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp sonic.png "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
