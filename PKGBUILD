pkgname=jdminecraftlauncher
pkgver=3.0
pkgrel=1
pkgdesc="A oldstyle Minecraft launcher written in Python"
arch=("any")
url="https://gitlab.com/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python"
	 "python-setuptools"
         "python-pyqt6"
         "python-pyqt6-webengine"
         "python-requests"
         "python-minecraft-launcher-lib"
         "python-jdtranslationhelper")
makedepends=("gendesk")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdMinecraftLauncher/-/archive/${pkgver}/jdMinecraftLauncher-${pkgver}.tar.gz")
sha256sums=("b7e15059147d3480fa408789c850f252c38e7624fb8bb30f86b0784c4c1b76ae")

package() {
    cd "jdMinecraftLauncher-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "jdMinecraftLauncher/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdMinecraftLauncher.svg"
    gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "jdMinecraftLauncher" \
            --comment "$pkgdesc" \
            --exec jdMinecraftLauncher \
            --categories "Game"
            --icon "com.gitlab.JakobDev.jdMinecraftLauncher"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
