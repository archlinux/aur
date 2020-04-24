# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=2.0.0
pkgrel=2
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.2+10+9541587' 'python-xpybutil' 'python-numpy')
makedepends=('python-distutils-extra' 'git')
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz")
#sha256sums=('f1ffbc7cdeb77474c4dfaa6ec7db66d797aa750af164f9e343860ea9ea0dbbe5')
source=("${pkgname}::git+https://github.com/hhannine/superpaper.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}" #-${pkgver}"
  # Revert image optimizations which bumped the Pillow dep to 7.0+
  # until Arch updates the python-pillow package.
  git revert --no-edit '6eecf85a628cc898b943959920e7fb479b985044'
}
    
package() {
  cd "${srcdir}/${pkgname}" #-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
