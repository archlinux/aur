# Maintainer: Keil <keilmillerjr@outlook.com>
# GitLab: https://gitlab.com/quiet-corner-linux/aur-odadrawingsexplorer-bin
pkgname=odadrawingsexplorer-bin
pkgver=8.3dll_26.12
pkgrel=5
pkgdesc="ODA Drawings Explorer – DWG/DXF viewer and file manager (binary release)"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/oda_drawings_explorer"
license=('custom')
depends=('qt6-base' 'qt6-svg')
options=(!strip)

# Upstream filename is always:
#   ODADrawingsExplorer_QT6_lnxX64_${pkgver}.deb
# CI ensures pkgver is the full upstream version.
source=("ODADrawingsExplorer.deb::https://www.opendesign.com/guestfiles/get?filename=ODADrawingsExplorer_QT6_lnxX64_${pkgver}.deb"
        "odadrawingsexplorer.desktop"
        "odadrawingsexplorer.png")
sha256sums=('a07d8273835f96be6a6d756c733fc2746f412463983fc03995ebf49c77855f55'
            'c38b49c1911984fe1836f51a9411d15b027edd3e1b03710f65768450dcee5554'
            '845dec7e66bf9d2213c9371fe8f7cc91f5c38230fdaf1c8eac7558ac38278c2b')

package() {
    bsdtar -xf ODADrawingsExplorer.deb -C "$srcdir"
    bsdtar -xf "$srcdir/data.tar.*" -C "$pkgdir"

    install -Dm644 "$srcdir/odadrawingsexplorer.desktop" \
        "$pkgdir/usr/share/applications/odadrawingsexplorer.desktop"

    install -Dm644 "$srcdir/odadrawingsexplorer.png" \
        "$pkgdir/usr/share/pixmaps/odadrawingsexplorer.png"

    install -Dm644 "$srcdir/usr/share/doc/ODA_Drawings_Explorer/license.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
