pkgname=subtitleedit
pkgver=3.5.1
pkgrel=2
pkgdesc="A subtitle editor"
arch=('any')
url="http://www.nikse.dk/subtitleedit/"
license=('GPL3')
depends=('mono')
optdepends=('vlc: Video support')
makedepends=('unzip' 'imagemagick')
pkgver_nz="${pkgver%.0}"
source=(
    "https://github.com/SubtitleEdit/subtitleedit/releases/download/$pkgver/SE${pkgver_nz//./}.zip"
    "https://raw.githubusercontent.com/SubtitleEdit/subtitleedit/$pkgver/src/Icons/SE.ico"
    "subtitleedit"
    "subtitleedit.desktop"
)
sha256sums=(
    'b621e61a7a9a1e6711661ba90ac10bc729fffa0cf4900e9ae42b1088d29e0ff7'
    'a2d211e7ce3597b25db9f921590169c89d0b47dad48669dfffb6795a7ba534cd'
    'f1e7b1ef8116afaaac61a6ddd871fb6ec349ab729d068f1c3195d0fbabafc2bc'
    '32977a0b82619f04e1ce904ac9c02ced410aa6cb563e86e90ce46225dc63adee'
)
noextract=("SE${pkgver_nz//./}.zip")

package() {
    install -d "$pkgdir/usr/share/subtitleedit"
    unzip "$srcdir/SE${pkgver_nz//./}.zip" -d "$pkgdir/usr/share/subtitleedit"
    touch "$pkgdir/usr/share/subtitleedit/.PACKAGE-MANAGER"
    
    install -Dm755 "$srcdir/subtitleedit" "$pkgdir/usr/bin/subtitleedit"
    install -Dm644 "$srcdir/subtitleedit.desktop" "$pkgdir/usr/share/applications/subtitleedit.desktop"
    
    install -d "$pkgdir/usr/share/pixmaps"
    convert "$srcdir/SE.ico[6]" "$pkgdir/usr/share/pixmaps/subtitleedit.png"
}
