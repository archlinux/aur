pkgname=subtitleedit
pkgver=3.6.2
pkgrel=2
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
    "https://github.com/SubtitleEdit/subtitleedit/raw/$pkgver/src/ui/Icons/SE.ico"
    "subtitleedit"
    "subtitleedit.desktop"
)
sha256sums=(
    'a337fcc34f7df3a1a4912b088cd9d2b3903edfb5a03996c4e731d17861e2f4c1'
    '7efc7a341ee949f5b3742741a1431c0af7ab14aa1d7f35a654f6ec2eb4fc9457'
    '2060b2b85e2c50152a266a3697efe7b9fbfe7c2af4cdf6a9c6af8a30a6169b52'
    '32977a0b82619f04e1ce904ac9c02ced410aa6cb563e86e90ce46225dc63adee'
)
noextract=("SE${pkgver//./}.zip")

package() {
    install -d "$pkgdir/usr/share/subtitleedit"
    unzip "$srcdir/SE${pkgver//./}.zip" -d "$pkgdir/usr/share/subtitleedit"
    rm -r "$pkgdir/usr/share/subtitleedit/Tesseract302"
    rm "$pkgdir/usr/share/subtitleedit/Hunspell"{x86,x64}.dll
    touch "$pkgdir/usr/share/subtitleedit/.PACKAGE-MANAGER"

    install -Dm755 "$srcdir/subtitleedit" "$pkgdir/usr/bin/subtitleedit"
    install -Dm644 "$srcdir/subtitleedit.desktop" "$pkgdir/usr/share/applications/subtitleedit.desktop"

    install -d "$pkgdir/usr/share/pixmaps"
    convert "$srcdir/SE.ico[9]" "$pkgdir/usr/share/pixmaps/subtitleedit.png"
}
