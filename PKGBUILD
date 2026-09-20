pkgname=cavestory
_pkgname=CaveStory
pkgver=1.1
pkgrel=1
pkgdesc="Cave Story powered by the nxengine-evo."
url="https://gitlab.com/linuxbombay/cavestory"
arch=('x86_64' 'i386' 'i686' 'aarch64')
license=('GPL')
depends=('nxengine-evo-bin' 'wget' 'unzip' 'zenity')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/cavestory-$pkgver.tar.bz2" "https://www.cavestory.org/downloads/cavestoryen.zip")
sha256sums=('ec99e93bd461d3a77721ed4fe2260f0fece578fbcc3447cb16aa3213c552fd30'
            'aa87fa30bee9b4980640c7e104791354e0f1f6411ee0d45a70af70046aa0685f')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Packaging files
    cp "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
    cp -rf "$srcdir/$pkgname-$pkgver/"* "$pkgdir/usr/share/games/$_pkgname"
    cp -rf "$srcdir/CaveStory/"* "$pkgdir/usr/share/games/$_pkgname"
    cp "$srcdir/$pkgname-$pkgver/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
