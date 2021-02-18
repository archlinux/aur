pkgname=subtitleedit
pkgver=3.6.0
pkgrel=1
pkgdesc="A subtitle editor"
arch=('any')
url="http://www.nikse.dk/subtitleedit/"
license=('GPL3')
depends=('mono')
optdepends=(
    'vlc: Video support'
    'mpv: Video support'
    'tesseract: OCR support'
)
makedepends=('unzip' 'imagemagick')
source=(
    "https://github.com/SubtitleEdit/subtitleedit/releases/download/$pkgver/SE${pkgver//./}.zip"
    "https://github.com/SubtitleEdit/subtitleedit/raw/$pkgver/src/ui/SE.ico"
    "subtitleedit"
    "subtitleedit.desktop"
)
sha256sums=(
    'd74b5e98b599c35e37e64f6edf251bd118ebea87f0e2caba76603a067734f07b'
    '7efc7a341ee949f5b3742741a1431c0af7ab14aa1d7f35a654f6ec2eb4fc9457'
    'f1e7b1ef8116afaaac61a6ddd871fb6ec349ab729d068f1c3195d0fbabafc2bc'
    '32977a0b82619f04e1ce904ac9c02ced410aa6cb563e86e90ce46225dc63adee'
)
noextract=("SE${pkgver//./}.zip")

package() {
    install -d "$pkgdir/usr/share/subtitleedit"
    unzip "$srcdir/SE${pkgver//./}.zip" -d "$pkgdir/usr/share/subtitleedit"
    touch "$pkgdir/usr/share/subtitleedit/.PACKAGE-MANAGER"

    install -Dm755 "$srcdir/subtitleedit" "$pkgdir/usr/bin/subtitleedit"
    install -Dm644 "$srcdir/subtitleedit.desktop" "$pkgdir/usr/share/applications/subtitleedit.desktop"

    install -d "$pkgdir/usr/share/pixmaps"
    convert "$srcdir/SE.ico[9]" "$pkgdir/usr/share/pixmaps/subtitleedit.png"
}
