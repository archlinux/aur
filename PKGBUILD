_pkgname=pymacropad
pkgname=$_pkgname-git
pkgrel=1
pkgver=1.2.2.r1.gebfac84
pkgdesc="Utility program for binding actions to keys on a given input"
url="https://github.com/j-waters/pymacropad"
depends=('python-click'
         'python-yaml'
         'python-libevdev'
         'python-pyxdg')
makedepends=('git' 'python-setuptools')
conflicts=('pymacropad')
provides=('pymacropad')
license=('GPL')
arch=('any')
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

