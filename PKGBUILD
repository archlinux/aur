# Maintainer: Maor Kadosh <maor@avocadosh.xyz>
pkgname=sononym
pkgver=1.5.6
pkgrel=2
pkgdesc="Audio sample manager and categorizer"
arch=("x86_64")
url="https://www.sononym.net"
license=('custom:sononym')

source=("https://www.sononym.net/download/sononym-${pkgver}.tar.bz2"
        "logo.svg"
        "sononym.desktop")
sha256sums=('6f883b158e89c9005ca376dfd717be4606b4a0150ef6c816fc3cb4da3298ee4c'
            'a3e8e1f684398ab4fa8d209bee8b0d652fdd0a5f3553276ad1d0664f1a23960e'
            '92685f95c29a0b10a6ece3328b28efc6bfbd6b46fbfa0790c27915b936922249')

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
