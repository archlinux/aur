# Maintainer: Maor Kadosh <maor@avocadosh.xyz>
pkgname=sononym
pkgver=1.5.3
pkgrel=2
pkgdesc="Audio sample manager and categorizer"
arch=("x86_64")
url="https://www.sononym.net"
license=('custom:sononym')

source=("https://www.sononym.net/download/sononym-${pkgver}.tar.bz2"
        "logo.svg"
        "sononym.desktop")
sha256sums=("08f08433c1bd2d26be15fcd5d31a7bac06e05f58a2f3c6f8847b135537bdbc23"
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
