# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=meteo-qt
pkgname="$_pkgname"-git
pkgver=4.3.r4.gc1e1e87
pkgrel=1
pkgdesc='System tray application for weather status information'
arch=('any')
url='https://github.com/dglent/meteo-qt'
license=('GPL-3.0-only')
depends=('python-lxml' 'python-pyqt6' 'python-urllib3')
makedepends=('git' 'python-setuptools' 'qt6-tools')
optdepends=('qt6-translations: translations of some native UI components')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git" 'fix-lrelease-path.patch')
b2sums=("SKIP"
        '87b776db210fcbea082db5f055e902efe91edde62384b458681edeead9dee9043263fcb187ba3727bbe645452089449f68e6dc13026419648de1342cdf040958')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's|^v||;s|-|.r|;s|-|.|'
}

prepare() {
    cd $_pkgname
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root $pkgdir
}
