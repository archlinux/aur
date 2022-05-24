# Maintainer:  Frank Seifferth <frankseifferth@posteo.net>

pkgname=abricotine-bin
_pkgname=abricotine
conflicts=("abricotine")
provides=("abricotine")
pkgver=1.1.3
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('libxss')
source=("https://github.com/brrd/Abricotine/releases/download/v${pkgver}/abricotine_${pkgver}_amd64.deb"
        "abricotine.desktop")
sha256sums=('9d70b0b566936ab99209111968c4af525e2f1c3fef2f25b2cbeef7f1ff17a46b'
            '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c')

prepare() {
    cd "$srcdir"
    tar xf data.tar.xz
}

package() {
    cd "$srcdir"

    install -d "$pkgdir/opt/abricotine"
    cp -r opt/Abricotine/* "$pkgdir/opt/abricotine"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/abricotine/abricotine" "$pkgdir/usr/bin/abricotine"

    install -Dm644 "../abricotine.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 \
        "usr/share/icons/hicolor/48x48/apps/abricotine.png" \
        "$pkgdir/usr/share/pixmaps/abricotine.png"
}
