# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=meteo-qt
pkgver=4.3
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python' 'python-lxml' 'python-pyqt6')
makedepends=('python-setuptools' 'qt6-tools')
optdepends=('qt6-translations: translations of some native UI components')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1cd21c8019db4e895b938496487e3b5483f7079c17d22d633b0c6052d08cba5ebd9be68381a4eb3551694d38f4128ef04219d134919499486ad3c6e1e9f5935d')

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
