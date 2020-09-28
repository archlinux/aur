pkgname=jdminecraftlauncher
pkgver=2.4
pkgrel=1
pkgdesc='A oldstyle Minecraft launcher written in Python'
arch=('any')
url="https://gitlab.com/JakobDevjdMinecraftLauncher"
license=('GPL3')
depends=('python-pyqt5'
         'python-pyqtwebengine'
         'python-requests'
         'python-minecraft-launcher-lib'
         'python-jdtranslationhelper'
         'python-cryptography')
makedepends=('python-setuptools' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdMinecraftLauncher/-/archive/${pkgver}/jdMinecraftLauncher-${pkgver}.tar.gz")
sha256sums=('5c00c0ac58b1237582d0407282716dccde53e55b0d1555a9010d5ce2496efdc9')

package() {
  cd "jdMinecraftLauncher-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "jdMinecraftLauncher" \
            --comment "$pkgdesc" \
            --exec jdMinecraftLauncher \
            --categories 'Game'
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
