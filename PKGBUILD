# Maintainer: Agesly Danzig

pkgname=pext
_pkgname=Pext
pkgver=0.25
pkgrel=1
pkgdesc='Python-based extendable tool'
url='https://pext.io/'
arch=(any)
license=(GPL3)
depends=(python-dulwich python-pynput python-pip python-pyqt5 qt5-quickcontrols python-opengl python-opengl-accelerate python-requests python-watchdog)
makedepends=(python-setuptools)
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support')
provides=(pext)
conflicts=(pext)
source=("https://github.com/Pext/Pext/archive/v$pkgver.tar.gz")
sha256sums=('d6d8bb74ab56f31d5bd20bc4db52ccaef550ca06b8ce4191791e90715f6a46b5')

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
