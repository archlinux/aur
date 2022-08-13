# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=3.6.7
pkgrel=1
pkgdesc='An advanced subtitle editor and converter'
arch=('any')
url='https://www.nikse.dk/SubtitleEdit'
license=('GPL3')
depends=('mono')
optdepends=('vlc: Video support'
            'mpv: Video support'
            'tesseract: OCR support')
makedepends=('unzip')
source=("https://github.com/SubtitleEdit/subtitleedit/releases/download/$pkgver/SE${pkgver//./}.zip"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
sha256sums=('208cc11e303dd1fc7931e38ef8c0061d3dd44692048d5b59561fdbcf97ab79c2'
            '51ae2411ed70a40607a78dd863db98bf5692bfaff7f8c230ddf82f0dc78d1cc3'
            '54ffb47864611c6aebb29ecfabd49089cfe6decc320e3f25043c39ec7f27a5fb'
            '700d09858ac76341054d7edc79952fbfca70df674d2b567e3713579e5963f631')

noextract=("SE${pkgver//./}.zip")

package() {
    install -dm755 "$pkgdir/opt/subtitleedit"
    unzip "$srcdir/SE${pkgver//./}.zip" -d "$pkgdir/opt/subtitleedit"

    rm -r "$pkgdir/opt/subtitleedit/Tesseract302"
    rm "$pkgdir/opt/subtitleedit/Hunspell"{x86,x64}.dll
    touch "$pkgdir/opt/subtitleedit/.PACKAGE-MANAGER"

    install -Dm755 "$srcdir/subtitleedit" "$pkgdir/usr/bin/subtitleedit"

    install -Dm644 "$srcdir/subtitleedit.desktop" "$pkgdir/usr/share/applications/subtitleedit.desktop"

    install -Dm644 "$srcdir/subtitleedit.png" "$pkgdir/usr/share/pixmaps/subtitleedit.png"
}
