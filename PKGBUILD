# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdnbtexplorer
pkgver=1.2
pkgrel=1
pkgdesc="A Editor for Minecraft NBT files"
arch=("any")
url="https://gitlab.com/JakobDev/jdNBTExplorer"
license=("GPL3")
depends=("python" "python-pyqt6" "python-jdtranslationhelper" "python-nbt" "python-setuptools")
makedepends=("gendesk")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdNBTExplorer/-/archive/${pkgver}/jdNBTExplorer-${pkgver}.tar.gz")
sha256sums=("93ca67a4e3a102628b9e808c05f075acd2004dec1d6acb9784721dcd35a71a2e")

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
        --categories "Game" \
        --icon "${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
