# Maintainer: Schwan Carl <schwancarl at protonmail dot com>

pkgname=webnovel-manager-git
pkgver=v1.3.r0.gf4e4b90
pkgrel=1
pkgdesc="Webnovel reader"
arch=('any')
url="https://github.com/ognarb/webnovel-manager"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-requests' 'python-fuzzywuzzy' 'python-click' 'python-beautifulsoup4') 
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ognarb/webnovel-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
