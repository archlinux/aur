# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
pkgver=6.0.5.1
pkgrel=9
pkgdesc='A modern and fast media cutter and joiner'
arch=('x86_64')
license=('GPL3')
url="https://vidcutter.ozmartians.com"
# source=(https://github.com/ozmartian/${pkgname%-git}/archive/${pkgver}.tar.gz)
source=(git+https://github.com/ozmartian/vidcutter.git)
depends=('ffmpeg' 'mediainfo' 'mpv' 'python-opengl' 'python-pyqt5' 'python-setuptools' 'python-simplejson')
makedepends=('git' 'python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter')
sha256sums=('SKIP')

# pkgver() {
#     cd "${pkgname%-git}-${pkgver}"
#     git describe --long --all | sed 's/\([^-]*-g\)/r\1/g;s/-/./g;s/heads\///g'
# }

build() {
    cd "${srcdir}/${pkgname%-git}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
