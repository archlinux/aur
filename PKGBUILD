# Maintainer: Ivan Gabaldon <aur[at]inetol[dot]net>
# Contributor: sukanka <su975853527 at gmail.com>

pkgname=tradingview
pkgver=2.3.4
pkgrel=1
pkgdesc='Experience extra power, extra speed and extra flexibility, all with the same UX you know and love'
arch=('x86_64')
url='https://www.tradingview.com/desktop/'
license=('custom')
makedepends=('squashfs-tools')
source=("$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_38.snap"
        "$pkgname.desktop")
b2sums=('424defb3d5f7f112460cefc22110841fc21070ae18f9d6cf3dad6fd109dac4a705c4890ca476e29fc5b1250bc3db7014ffcc0ec645d860540029073468044f41'
        '25d9a755a7af64a8ea212dfacb0611d2b928e9e1b293fe015329aff0470dd46b79acabac28c102a5af4d2f663d9324153c56c8803d605183c36bfbc3a8c6bb6d')

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
