# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
_pkgname=vidcutter
pkgver=3.2.0.r22.gb65458f
pkgrel=1
pkgdesc="The simplest + fastest video cut & merge tool"
arch=('any')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
source=(vidcutter-git::git+https://github.com/ozmartian/vidcutter.git)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter-git')
conflicts=('vidcutter')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    sed -i "s/pypi/arch/" "${_pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${pkgname}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
