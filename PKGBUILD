# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=2.0.2
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz"
        '0001_revert_pillow_7.0_requirement.patch')
sha256sums=('58b5c7f79d772142c819b00f4925193bc135fa29312d933b3a7cd8adcad9f56c'
            '0e00a061c96564310c42f8a18b8a2f67ac44a31544f1f48d496445f78b6f3530')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Revert image optimizations which bumped the Pillow dep to 7.0+
  # until Arch updates the python-pillow package.
  patch -Np2 -r- -i ../0001_revert_pillow_7.0_requirement.patch
}
    
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
