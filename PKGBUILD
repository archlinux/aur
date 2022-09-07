# Maintainer: QiE2035 <qie2035@qq.com>

_pkgname=logseq-desktop
pkgname=$_pkgname-non-opt
pkgver=0.8.4
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management. Use the system electron without opt."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
depends=('electron19')
provides=(
    "logseq-desktop"
)
conflicts=(
    "logseq-desktop-git"
    "logseq-desktop-bin"
    "logseq-desktop"
)
source=(
    "https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
    "${_pkgname}.desktop"
    "logseq"
)
sha256sums=(
    'c21b1bf3e8d13704bde52d1ba010268eed410ae81357e13565dc7ddd016820d6'
    '6e834466132551c721ba2ffe92fc0f81056b3151fe6b5f0f469ece937f9b7e84'
    '7d74cb642b050d987c5d534717fe3b49de5d31c0b0d7aed9747bfb81441f4059'
)

package() {
    cd "$srcdir/Logseq-linux-x64"
    # desktop file
    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/logseq.desktop
    # icons
    install -Dm644 "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/pixmaps/logseq.png"
    install -d ${pkgdir}/usr/lib/${_pkgname}
    cp -r $srcdir/Logseq-linux-x64/resources/app/* ${pkgdir}/usr/lib/${_pkgname}/
    install -d ${pkgdir}/usr/bin
    install -Dm755 "$srcdir/logseq" "${pkgdir}/usr/bin/logseq"
}
