# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

_pkgname="logseq-desktop"
pkgname="$_pkgname-bin"
pkgver=0.9.16
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop")
install="$_pkgname.install"
source=(
    "$url/releases/download/$pkgver/logseq-linux-x64-$pkgver.zip"
    "$_pkgname.desktop"
    "$_pkgname.sh"
)
sha256sums=(
    '977c9b9a478111cd64f960bff75f2e17b05adb53e57ccc8ed1f33eea88230301'
    'dfc071a4740a2329746b9b9e30dd7aa34016e9c7e01e1c451d4a23415a2d4b65'
    '79749ee5011f229810343fb4a4eeb60de986d541617ead4242ccf0057b263a55'
)

package() {
    cd "$srcdir/Logseq-linux-x64"

    # desktop file, make minitype works as expected.
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/logseq-desktop.desktop"

    # icons
    install -Dm644 \
        "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" \
        -t "$pkgdir/usr/share/pixmaps/"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/Logseq-linux-x64"/* "$pkgdir/opt/$pkgname/"

    # User flag aware launcher
    install -Dm755 "$srcdir/logseq-desktop.sh" "$pkgdir/usr/bin/logseq"
}
