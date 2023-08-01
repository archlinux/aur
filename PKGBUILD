# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-xdgspec-git
pkgver=0.2.1.r3.g45c3cef
pkgrel=3
epoch=
pkgdesc="XDG Base Directory Specification for Python"
arch=(any)
url="https://gitlab.com/nobodyinperson/python3-xdgspec"
license=('GPL')
groups=()
depends=(python)
makedepends=(python-{build,installer,wheel})
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+$url")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver () {
    cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build () {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/${pkgname%-git}"
    export PYTHONHASHSEED=0
    python -m installer --destdir="$pkgdir" dist/*.whl
}
