# Maintainer: Chris Simons < chris at simonsmail dot net >

pkgname=("protonfixes-updated-git")
pkgver=r235.6ea9df5
pkgrel=1
pkgdesc="A module for applying fixes at runtime to unsupported games with Steam Proton without changing game installation files"
arch=("any")
url="https://github.com/simons-public/protonfixes"
license=("BSD")
makedepends=("python-setuptools")
optdepends=('wine: win32 proton prefix support'
            'winetricks: winetricks support'
            'python-cef: splash dialog support'
            'zenity: splash dialog support')
source=("${pkgname}::git+https://github.com/simons-public/protonfixes#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
