# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdnbtexplorer
pkgver=1.1
pkgrel=1
pkgdesc="A Editor for Minecraft NBT files"
arch=("any")
url="https://gitlab.com/JakobDev/jdNBTExplorer"
license=("GPL3")
depends=("python-pyqt6" "python-jdtranslationhelper" "python-nbt" "python-setuptools")
makedepends=("gendesk")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdNBTExplorer/-/archive/${pkgver}/jdNBTExplorer-${pkgver}.tar.gz")
sha256sums=("4b7a32b65e31d4c8121db12c5af8842bfbe02f55a094ab745efc7d4ee3b7f684")

package() {
    cd "jdNBTExplorer-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "jdNBTExplorer/Logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --pkgname "${pkgname}" \
        --pkgdesc "$pkgdesc" \
        --name "jdNBTExplorer" \
        --comment "$pkgdesc" \
        --exec jdNBTExplorer \
        --categories "Game"
        --icon "${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
