# Maintainer : Fenner Macrae <fmacrae.dev at gmail dot com>

_pkgname=flashfocus
pkgname=$_pkgname-git
pkgrel=1
pkgver=2.4.0
pkgdesc="Simple focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
depends=('python-xcffib'
         'python-click'
         'python-xpybutil'
         'python-marshmallow'
         'python-yaml'
         'python-i3ipc')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
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
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 flashfocus.service "${pkgdir}/usr/lib/systemd/user/flashfocus.service"
}
