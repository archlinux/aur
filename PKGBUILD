# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=tidal-dl-git
_pkgname=Tidal-Media-Downloader
pkgver=1.1.1.0.r35.g51fbf37
pkgrel=2
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=(
    'python-prettytable'
    'python-aigpy'
    'python-libffmpeg'
    'python-pycryptodome'
    'python-pydub'
)
makedepends=(
    'git'
    'python-setuptools'
)
conflicts=('tidal-dl')
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/TIDALDL-PY"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}/TIDALDL-PY"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}/TIDALDL-PY"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
