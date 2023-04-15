# Maintainer: okhsunrog <me@okhsunrog.ru>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=logseq-desktop-wayland-bin
_pkgname=logseq-desktop
pkgver=0.9.2
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management. Enabled flags for wayland support."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop-git" "logseq-desktop")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${_pkgname}.desktop")
sha256sums=('85ac4ec2ed01ae5d277f3435de1758174247f7c6888ce28909335795991739dc'
            'd3ef0abb2af02d7a27bf158921297d9cafebd73c9c955e893060b56a4cecd7a5')

package() {
    cd "$srcdir/Logseq-linux-x64"
    # desktop file, make minitype works as expected.
    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/logseq-desktop.desktop
    # icons
    install -Dm644 "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/pixmaps/logseq.png"
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/Logseq-linux-x64/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/Logseq ${pkgdir}/usr/bin/logseq
}
