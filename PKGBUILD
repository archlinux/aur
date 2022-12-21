# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=2.2.1
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow>=7.0' 'python-screeninfo>=0.6.1' 'python-wxpython'
         'python-system_hotkey>=1.0.5' 'python-xpybutil' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz"
        'rename_system_hotkey_dep.patch')
sha256sums=('8296f218fe4bd524e34bc427b5c2d02c80acdd0e05563206e154a31eb944bb20'
            '02bc7fb70c18c7292ee9cdac9be58e0954cdb03b07032ee9b5c567fe5ec4d5a5')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np2 -r- -i ../rename_system_hotkey_dep.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
