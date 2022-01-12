# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=tidal-dl-git
_pkgname=Tidal-Media-Downloader
pkgver=2022.01.11.1.r0.g1b3afaa
pkgrel=2
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('APACHE')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome' 
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil')
makedepends=('git')
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
