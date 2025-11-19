# Maintainer: Groctel <aur@taxorubio.com>

_name=networkx

pkgname=python-networkx-git
pkgver=3.6rc0.r8.g6dbed05b6
pkgrel=1
pkgdesc="Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks."

arch=("any")
license=("BSD")
url="https://github.com/networkx/networkx"

source=("git+$url#branch=main")
sha512sums=('SKIP')

conflicts=("python-networkx")
provides=("python-networkx=$pkgver")

depends=(
    "python-decorator"
    "python-matplotlib"
    "python-numpy"
    "python-pandas"
    "python-scipy"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
)

pkgver () {
    cd "$srcdir/$_name" || exit
    git describe --long --tags | sed 's/^networkx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "$srcdir/$_name" || exit
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name"
    pytest
}

package () {
    cd "$srcdir/$_name" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
