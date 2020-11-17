_pkgname=dynbsp
pkgname=$_pkgname-git
pkgrel=1
pkgver=1.0.0.r0.gb3c75bb
pkgdesc="Application for automatically adding, removing and renaming desktops in BSPWM"
url="https://github.com/j-waters/dynbsp"
depends=('python-click'
         'python-yaml')
makedepends=('git' 'python-setuptools')
conflicts=()
provides=()
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")


pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}