# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

_pkgname="logseq-desktop"
pkgname="$_pkgname-bin"
pkgver=0.9.18
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop")
install="$_pkgname.install"
source=(
    "$url/releases/download/$pkgver/Logseq-linux-x64-$pkgver.zip"
    "$_pkgname.desktop"
    "$_pkgname.sh"
)
sha256sums=('0b8dd345d0e7c3b704f10b252ba4db52f1c9430c6b46c6fda1ba8b5b15664f18'
            '12eb07a20c29f9573bbb91e585602a150d5f851cdb15ae43e6319d075b7ecbba'
            '79749ee5011f229810343fb4a4eeb60de986d541617ead4242ccf0057b263a55')

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
