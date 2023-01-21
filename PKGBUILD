# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=openshot-git
pkgver=3.0.0.r25.g369b68de
pkgrel=1
pkgdesc='An open-source, non-linear video editor for Linux based on MLT framework (git version)'
arch=('any')
url='https://www.openshot.org/'
license=('GPL3')
depends=('ffmpeg' 'python-pyqt5' 'python-pyzmq' 'python-requests' 'qt5-base' 'qt5-svg'
         'python-pyqt5-webengine' 'libopenshot-git' 'libopenshot-audio-git')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('faac: for exporting audio using AAC')
provides=('openshot')
conflicts=('openshot')
source=('git+https://github.com/OpenShot/openshot-qt.git')
sha256sums=('SKIP')

pkgver() {
    git -C openshot-qt describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd openshot-qt
    python -m build --wheel --no-isolation
}

check() {
    cd openshot-qt
    python -m unittest discover -vs src/tests
}

package() {
    python -m installer --destdir="$pkgdir" openshot-qt/dist/*.whl
}
