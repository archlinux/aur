# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
_pkgname=vidcutter
pkgver=4.0.0.r141.gaee908e
_pkgver=master
pkgrel=1
pkgdesc="the simplest + fastest video cutter & joiner"
arch=('any')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${_pkgname}/archive/${_pkgver}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo' 'python-opengl')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter-git')
conflicts=('vidcutter')
md5sums=('SKIP')

# pkgver() {
#     cd "${_pkgname}-${_pkgver}"
#     git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

prepare() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    sed -i "s/pypi/arch/" "${_pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
