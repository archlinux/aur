# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=pext
_pkgname=Pext
pkgver=0.15
pkgrel=1
pkgdesc='Python-based extendable tool'
url='https://pext.hackerchick.me/'
arch=(any)
license=(GPL3)
depends=(python-dulwich libnotify python-pip python-pyqt5 qt5-quickcontrols)
makedepends=(python-setuptools)
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support'
            'python-opengl: required for correct rendering on some GPUs')
provides=(pext)
conflicts=(pext)
source=("https://github.com/Pext/Pext/archive/v$pkgver.tar.gz")
sha256sums=('b65f0f7e4623811ba74fa85efec964c41d17d8f845a520b2c0a6de0a0d63b389')

prepare() {
  sed "s/'pyqt5'//g" -i ${srcdir}/${_pkgname}-${pkgver}/setup.py
  sed "s/USE_INTERNAL_UPDATER = .*/USE_INTERNAL_UPDATER = False/" -i ${srcdir}/${_pkgname}-${pkgver}/pext/constants.py
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
