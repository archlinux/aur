# Maintainer: Agesly Danzig

pkgname=pext-git
_pkgname=Pext
pkgver=0.35
pkgrel=1
pkgdesc='Python-based extendable tool'
url='https://pext.io/'
arch=(any)
license=(GPL3)
depends=(python-dulwich python-pynput python-pip python-pyqt5 qt5-quickcontrols python-opengl python-opengl-accelerate python-requests python-watchdog python-psutil python-paramiko)
makedepends=(python-setuptools)
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support'
            'python-opengl: required for correct rendering on some GPUs')
provides=(pext)
conflicts=(pext)
source=('git+https://github.com/Pext/Pext.git')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo "$(git describe | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  sed "s/USE_INTERNAL_UPDATER = .*/USE_INTERNAL_UPDATER = False/" -i ${srcdir}/${_pkgname}/pext/constants.py
  rm ${srcdir}/${_pkgname}/requirements.txt
  touch ${srcdir}/${_pkgname}/requirements.txt
}

package() {
  cd ${_pkgname}
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
