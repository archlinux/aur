# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: groctel <aur@taxorubio.org>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=compiledb
pkgver=0.10.1
pkgrel=3
pkgdesc="Tool for generating Clang's JSON Compilation Database file for GNU make-based build systems"

replaces=(compiledb-generator)

arch=("any")
url="https://github.com/nickdiego/compiledb-generator"
license=("GPL3")

source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3f288e4897e2b17b4dd8070d3ad9e9fc627961faa4d0be29a78f6c619e055f36')

depends=(
    "python"
    "python-click"
    "python-bashlex"
    "python-shutilwhich"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$pkgname-$pkgver"
    pytest
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
