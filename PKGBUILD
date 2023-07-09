# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=logseq-desktop-bin
_pkgname=logseq-desktop
pkgver=0.9.10
pkgrel=3
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop-git" "logseq-desktop")
source=(
    "https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
    "${_pkgname}.desktop"
    "${_pkgname}.install"
    "${_pkgname}.sh"
)
sha256sums=('68413f7b378a2e56b998f6fd1ecbffd3283317296164a6b7ea7e44d16e316d3c'
            'dfc071a4740a2329746b9b9e30dd7aa34016e9c7e01e1c451d4a23415a2d4b65'
            'ad9bb5c0c7f9df5686201ed13c3f5566dcec65357bce33a7d143f160b59a9988'
            '79749ee5011f229810343fb4a4eeb60de986d541617ead4242ccf0057b263a55')

package() {
    cd "$srcdir/Logseq-linux-x64"
    # desktop file, make minitype works as expected.
    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/logseq-desktop.desktop
    # icons
    install -Dm644 "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/pixmaps/logseq.png"
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/Logseq-linux-x64/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    # User flag aware launcher
    install -m755 "${srcdir}/logseq-desktop.sh" "${pkgdir}/usr/bin/logseq"
}
