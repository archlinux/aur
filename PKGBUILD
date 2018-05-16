# Maintainer : Fenner Macrae <fmacrae.dev at gmail dot com>

_pkgname=flashfocus
pkgname=$_pkgname-git
pkgrel=1
pkgver=v0.3.6.r52.g519f89a
pkgdesc="Simple Xorg window focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
depends=('python-xcffib'
         'python-click'
         'python-xpybutil'
         'python-marshmallow'
         'python-yaml')
makedepends=('git' 'python-setuptools')
conflicts=('flashfocus')
provides=('flashfocus')
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
