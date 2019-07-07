# Maintainer: Agesly Danzig

pkgname=pext
_pkgname=Pext
pkgver=0.24.0
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
sha256sums=('efb6d425df46347088072e0d16a4682227c6a5426e3379824ff2c6dbba7d8e0f')

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
