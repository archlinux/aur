# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>

_pkgname="logseq-desktop"
pkgname="$_pkgname-bin"
pkgver=0.9.19
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management"
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop")
install="$_pkgname.install"

_pkgsrc="Logseq-linux-x64"
source=(
    "$url/releases/download/$pkgver/$_pkgsrc-$pkgver.zip"
    "$_pkgname.desktop"
    "$_pkgname.sh"
)
sha256sums=(
    'ae3da1053c45048d759722bdd787f2815c06b41a2c1627b1c429163abf3a9996'
    '12eb07a20c29f9573bbb91e585602a150d5f851cdb15ae43e6319d075b7ecbba'
    '79749ee5011f229810343fb4a4eeb60de986d541617ead4242ccf0057b263a55'
)

package() {
    cd "$srcdir/$_pkgsrc"

    # desktop file, make minitype works as expected.
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/logseq-desktop.desktop"

    # icons
    install -Dm644 \
        "$srcdir/$_pkgsrc/resources/app/icons/logseq.png" \
        -t "$pkgdir/usr/share/pixmaps/"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$_pkgsrc"/* "$pkgdir/opt/$pkgname/"

    # User flag aware launcher
    install -Dm755 "$srcdir/logseq-desktop.sh" "$pkgdir/usr/bin/logseq"
}
