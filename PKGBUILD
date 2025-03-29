# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=4.2
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-pyqt6')
makedepends=('python-setuptools' 'qt6-tools')
optdepends=('qt6-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('807b33b0fed573d129a344dd98da8c7d2f7cbfed9cde65cef7b62805f9afe5f75c9aeefec613a03ee30cc0df088f9984357a2658a6f02f0117e2f67e1c2ac67f')

prepare() {
    # setup.py assumes a command named lrelease-pro-qt6 exists.
    # This would be in qt6-tools, but it defines no command by that name
    # as of this writing; we have to patch setup.py manually.
    cd $pkgname-$pkgver
    sed -i 's/lrelease-pro-qt6/\/usr\/lib\/qt6\/lrelease-pro/' setup.py
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root $pkgdir
}

