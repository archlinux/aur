pkgname=subtitleedit
pkgver=3.5.1
pkgrel=1
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
    '5423868ec98b14cf2f46fe07f48f69477ad45409be90d1e8e58aaa2d1120faa1'
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
