# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openshot-git
pkgver=4.0.1.r64.g2cda67602
pkgrel=1
pkgdesc='An award-winning free and open-source video editor (git version)'
arch=('any')
url='https://www.openshot.org/'
license=('GPL-3.0-or-later')
depends=(
    'ffmpeg'
    'hicolor-icon-theme'
    'imagemagick'
    'libopenshot-audio-git'
    'libopenshot-git'
    'python'
    'python-pyqt6'
    'python-requests'
    'qt6-multimedia'
    'qt6-svg')
optdepends=(
    'faac: for exporting audio using AAC')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
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

package() {
    python -m installer --destdir="$pkgdir" openshot-qt/dist/*.whl
}
