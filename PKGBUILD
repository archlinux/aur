pkgname=jdminecraftlauncher
pkgver=2.5
pkgrel=1
pkgdesc="A oldstyle Minecraft launcher written in Python"
arch=("any")
url="https://gitlab.com/JakobDev/jdMinecraftLauncher"
license=("GPL3")
depends=("python"
	 "python-setuptools"
         "python-pyqt5"
         "python-pyqtwebengine"
         "python-requests"
         "python-minecraft-launcher-lib"
         "python-jdtranslationhelper"
         "python-cryptography")
makedepends=("gendesk")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdMinecraftLauncher/-/archive/${pkgver}/jdMinecraftLauncher-${pkgver}.tar.gz")
sha256sums=("3b2fc2f70a1b7a32f688462fe5003e97a75ea2ae0da8f55548b7a9e34a776521")

package() {
  cd "jdMinecraftLauncher-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "jdMinecraftLauncher" \
            --comment "$pkgdesc" \
            --exec jdMinecraftLauncher \
            --categories "Game"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
