# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=logseq-desktop-bin
_pkgname=logseq-desktop
pkgver=0.9.2
pkgrel=1
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
sha256sums=('85ac4ec2ed01ae5d277f3435de1758174247f7c6888ce28909335795991739dc'
            'fb4a2e59859b96c157f4da410cc66d8b6fff6e80fbc004577c238bc7d0b43258'
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
