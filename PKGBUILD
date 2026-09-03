# Maintainer:
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=4.0.0
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=('any')
url="https://www.openshot.org"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme'
         'libopenshot'
         'python'
         'python-certifi'
         'python-defusedxml'
         'python-distro'
         'python-numpy'
         'python-opengl'
         'python-pillow'
         'python-pyqt6'
         'python-pyzmq'
         'python-requests'
         'qt6-scxml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v${pkgver}.tar.gz")
sha512sums=('014dcbeeced9d989ea5c71dca1471e73ef5b2b359b4550b9c5778d0b4d77866ffe1d8028a6ec82b0f09bd1dde286c2458f7e59feffb4089ffa018682630a5c24')
b2sums=('d299b787132afc3943af8682c89d2a9c34bc24e6055ac5734ed3bd064193f6dd8bf52ad93a1c1691cbf66e153b916b03f36da6243386b36cff2259c54946fb70')

prepare() {
    cd "${pkgname}-qt-${pkgver}"
    sed -i 's/from qt_api/from .qt_api/' src/launch.py
}

build() {
    cd "${pkgname}-qt-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="${pkgdir}" "${pkgname}-qt-${pkgver}"/dist/*.whl
}
