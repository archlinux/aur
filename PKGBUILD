# Maintainer: Maor Kadosh <maor@avocadosh.xyz>
pkgname=sononym
pkgver=1.5.5
pkgrel=3
pkgdesc="Audio sample manager and categorizer"
arch=("x86_64")
url="https://www.sononym.net"
license=('custom:sononym')

source=("https://www.sononym.net/download/sononym-${pkgver}.tar.bz2"
        "logo.svg"
        "sononym.desktop")
sha256sums=("d8e7feecc5b289184ad3d8c949d166af5fe2335700b37d0185c159b1d8366c1e"
            "SKIP"
            "SKIP")

package() {
    install -Dm 644 "logo.svg" "$pkgdir/usr/share/pixmaps/sononym.svg"
    install -Dm 644 "sononym.desktop" "$pkgdir/usr/share/applications/sononym.desktop"

    d="$pkgdir/usr/share/sononym-${pkgver}"
    cd "$srcdir/sononym-${pkgver}"
    mkdir -p "$d"
    cp -r * "$d"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$d/sononym" "$pkgdir/usr/bin/sononym"

    # copy custom license:
    # https://wiki.archlinux.org/index.php/PKGBUILD#license
    install -Dm644 resources/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
