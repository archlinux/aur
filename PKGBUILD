# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: sukanka <su975853527 at gmail.com>

pkgname=tradingview
pkgver=2.6.1
pkgrel=1
pkgdesc='Experience extra power, extra speed and extra flexibility, all with the same UX you know and love'
arch=('x86_64')
url='https://www.tradingview.com/desktop/'
license=('custom')
makedepends=('squashfs-tools')
source=("$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_44.snap"
        "$pkgname.desktop")
b2sums=('0aae9c9043ef9da73f760968de88053a4c1b4ef397747c2b5df84146cd16f36bf40d915fed279b07ee254d775b87230d9961e13e2d0aee1901cbbd19096c0c64'
        '86d4c70928b6c2a4e3e95402be276e2de94216289d9e82c534d92b8a4db15252721c20be7a8828b8f4ba871d50903ba88137e9f5c374c46ff529584b8a7a8a89')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    unsquashfs -q -n -f -d "$pkgname-$pkgver/" $pkgname-$pkgver.snap

    mv "$pkgname-$pkgver/meta/gui/icon.png" "$srcdir"
    rm -r "$pkgname-$pkgver/"{data-dir/,gnome-platform/,lib/,meta/,scripts/,usr/}
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
