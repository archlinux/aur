# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=4.1
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-pyqt6')
makedepends=('python-setuptools' 'qt6-tools')
optdepends=('qt6-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0bd8a86795bfe81d99321894659427b754316b37d26e1352e515a7549a78511220e1d1df7596ecfbebe7d2d855133f9d4e978c8139a1477c87df49418bbeae7b')

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

