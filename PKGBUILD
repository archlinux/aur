# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: groctel <aur@taxorubio.org>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=compiledb
pkgver=0.10.7
pkgrel=3
pkgdesc="Tool for generating Clang's JSON Compilation Database file for GNU make-based build systems"

replaces=(compiledb-generator)

arch=("any")
url="https://github.com/nickdiego/compiledb"
license=("GPL-3.0-only")

source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('97752d8810b6977654a11a22cdc41bf6b71473bcdb5da312bc135f36d6af8271')

depends=(
    "python"
    "python-click"
    # AUR dependencies
    "python-bashlex"
    "python-shutilwhich"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-setuptools-scm"
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
