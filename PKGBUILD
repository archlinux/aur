# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=tidal-dl-git
_pkgname=Tidal-Media-Downloader
pkgver=2022.01.21.1.r2.g30917d1
pkgrel=1
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome' 
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil')
makedepends=('git')
provides=('tidal-dl')
conflicts=('tidal-dl')
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rf "${_pkgname}/TIDALDL-PY/tidal_gui"
}

build() {
  cd "${_pkgname}/TIDALDL-PY"
  python setup.py build
}

package() {
  cd "${_pkgname}/TIDALDL-PY"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
