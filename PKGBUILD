# Maintainer: okhsunrog <me@okhsunrog.ru>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=logseq-desktop-wayland-bin
_pkgname=logseq-desktop
pkgver=0.9.19
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management. Enabled flags for wayland support."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop-git" "logseq-desktop")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${_pkgname}.desktop")
sha256sums=('ae3da1053c45048d759722bdd787f2815c06b41a2c1627b1c429163abf3a9996'
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
