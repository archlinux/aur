# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=logseq-desktop-bin
_pkgname=logseq-desktop
pkgver=0.6.4
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop-git" "logseq-desktop")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${_pkgname}.desktop")
sha256sums=('9ea4cc567121e0f92859d3f00acc2d024fd2f3de1be93f10f04e822e156db263'
            '6e834466132551c721ba2ffe92fc0f81056b3151fe6b5f0f469ece937f9b7e84')

package() {
    cd "$srcdir/Logseq-linux-x64"
    # desktop file
    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/logseq.desktop
    # icons
    install -Dm644 "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/pixmaps/logseq.png"
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/Logseq-linux-x64/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/Logseq ${pkgdir}/usr/bin/logseq
}
