# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>
# Contributor: Chris Simons < chris at simonsmail dot net >

pkgname=("protonfixes-git")
pkgver=1.0.15.r128.gc121a1d
pkgrel=1
pkgdesc="A module for applying fixes at runtime to unsupported games with Steam Proton without changing game installation files - git version"
arch=("any")
url="https://github.com/simons-public/protonfixes"
license=("BSD")
provides=("protonfixes")
conflicts=("protonfixes")
makedepends=("git" "python-setuptools")
optdepends=('wine: win32 proton prefix support'
            'winetricks: winetricks support'
            'python-cef: splash progress dialog - deprecated'
            'python-kivy: splash progress dialog'
            'kdialog: splash progress dialog'
            'zenity: splash progress dialog')
source=("${pkgname}::git+https://github.com/simons-public/protonfixes#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
