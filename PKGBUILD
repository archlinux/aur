# Maintainer: Ivan Gabaldon <ivan [d0t] gab [at] inetol [d0t] net>
# Contributor: sukanka <su975853527 at gmail.com>

pkgname=tradingview
pkgver=2.0.0
pkgrel=1
pkgdesc='Experience extra power, extra speed and extra flexibility, all with the same UX you know and love'
arch=('x86_64')
url='https://www.tradingview.com/desktop/'
license=('custom')
makedepends=('squashfs-tools')
conflicts=("$pkgname-bin")
source=("$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_29.snap"
        "$pkgname.desktop")
b2sums=('92e97eddf2f7946d519b130278ddae4c4c09ce8d06f0a9dd24d65074bb3a685e034fc178fa92d68ea8e73398bc0007f7110370d199457cab855d0e816fe04966'
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
