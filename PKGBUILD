# Maintainer: Agesly Danzig <agesly.danzig@gmail.com>

pkgname=pext
_pkgname=Pext
pkgver=0.28
pkgrel=1
pkgdesc='Python-based extendable tool'
url='https://pext.io/'
arch=(any)
license=(GPL3)
depends=(python-dulwich python-pynput python-pip python-pyqt5 qt5-quickcontrols python-opengl python-opengl-accelerate python-requests python-watchdog python-psutil python-paramiko)
makedepends=(python-setuptools)
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support')
provides=(pext)
conflicts=(pext)
source=("https://github.com/Pext/Pext/archive/v$pkgver.tar.gz")
sha256sums=('17a769acefec539fdbb2e354e400508fdff1258afe0661721ee4d7d25959f82e')

prepare() {
  sed "s/USE_INTERNAL_UPDATER = .*/USE_INTERNAL_UPDATER = False/" -i ${srcdir}/${_pkgname}-${pkgver}/pext/constants.py
  rm ${srcdir}/${_pkgname}-${pkgver}/requirements.txt
  touch ${srcdir}/${_pkgname}-${pkgver}/requirements.txt
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
