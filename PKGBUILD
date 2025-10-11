# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openshot-git
pkgver=3.3.0.r127.g4de6e593c
pkgrel=1
pkgdesc='An award-winning free and open-source video editor (git version)'
arch=('any')
url='https://www.openshot.org/'
license=('GPL-3.0-or-later')
depends=(
    'ffmpeg'
    'hicolor-icon-theme'
    'libopenshot-audio-git'
    'libopenshot-git'
    'python'
    'python-pyqt5'
    'python-pyqt5-webengine'
    'python-pyzmq'
    'python-requests'
    'qt5-base'
    'qt5-svg')
optdepends=(
    'faac: for exporting audio using AAC')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
checkdepends=(
    'xorg-server-xvfb')
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
    xvfb-run -n 71 python src/tests/query_tests.py
}

package() {
    python -m installer --destdir="$pkgdir" openshot-qt/dist/*.whl
}
