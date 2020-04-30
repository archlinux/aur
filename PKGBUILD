# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=2.0.1
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz"
        '0001_revert_e7c59c9d5d1ff0d40554909b906cbdbd6642e01d.patch::https://github.com/hhannine/superpaper/commit/e7c59c9d5d1ff0d40554909b906cbdbd6642e01d.patch'
        '0002_revert_pillow_7.0_requirement.patch::https://github.com/hhannine/superpaper/commit/6eecf85a628cc898b943959920e7fb479b985044.patch')
sha256sums=('8cc6e271b754398e6368f773019df74366f09712742fb24109817506cfbd7fef'
            '748a38ad800dd63e107bd4cd54fd25e276d7d13a410eddbfb8e0e78ab6c12ee6'
            '8a76617f08175ec0c98b40228de920e1a1252727d229c5e32f7787ffe336a994')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Revert image optimizations which bumped the Pillow dep to 7.0+
  # until Arch updates the python-pillow package.
  patch -Rp1 -i ../0001_revert_e7c59c9d5d1ff0d40554909b906cbdbd6642e01d.patch
  patch -Rp1 -i ../0002_revert_pillow_7.0_requirement.patch
}
    
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
