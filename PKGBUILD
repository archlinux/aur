# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=logseq-desktop-bin
_pkgname=logseq-desktop
pkgver=0.8.13
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop-git" "logseq-desktop")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${_pkgname}.desktop")
sha256sums=('2d4899d5500d52f78c3e9ef6b3712631f485c695ddd1491b97f6ed4a36fe0ea4'
            '7efeec2aa0ae3dd9037ab7dff56ebde6947d3e1d09c7e438af16a8c68552bff9')

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
