# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=openshot-git
pkgver=2.4.4.r601.g1a7ebc1f
pkgrel=1
pkgdesc='An open-source, non-linear video editor for Linux based on MLT framework (git version)'
arch=('any')
url='https://www.openshot.org/'
license=('GPL3')
depends=('ffmpeg' 'python-mlt' 'python-pyqt5' 'python-requests' 'libopenshot-git'
         'libopenshot-audio-git' 'python-pyzmq' 'qt5-base' 'qt5-svg' 'qt5-webkit')
makedepends=('git' 'python-setuptools')
optdepends=('faac: for exporting audio using AAC')
provides=('openshot')
conflicts=('openshot')
source=('git+https://github.com/OpenShot/openshot-qt.git')
sha256sums=('SKIP')

pkgver() {
    cd openshot-qt
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd openshot-qt
    python setup.py build
}

package() {
    cd openshot-qt
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
