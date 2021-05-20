# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdnbtexplorer
pkgver=1.0
pkgrel=1
pkgdesc="A Editor for Minecraft NBT files"
arch=("any")
url="https://gitlab.com/JakobDev/jdNBTExplorer"
license=("GPL3")
depends=("python-pyqt6" "python-jdtranslationhelper" "python-nbt" "python-setuptools")
makedepends=("gendesk")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdNBTExplorer/-/archive/${pkgver}/jdNBTExplorer-${pkgver}.tar.gz")
sha256sums=("20c9842fb309b4a168a71615c85617860bebc127e68cbfeae4ec25aa247fdaed")

package() {
    cd "jdNBTExplorer-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --pkgname "${pkgname}" \
        --pkgdesc "$pkgdesc" \
        --name "jdNBTExplorer" \
        --comment "$pkgdesc" \
        --exec jdNBTExplorer \
        --categories "Game"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
