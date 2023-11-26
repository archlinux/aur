# Maintainer: Groctel <aur@taxorubio.com>

_name=cloup

pkgname=python-cloup
pkgver=3.0.3
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."

arch=('any')
license=('MIT')
url="https://github.com/janLuke/cloup"

source=("https://github.com/janLuke/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8bb90afc8f9d84df9f0173bf6d861d487dfc085191021636599f1e519d9903a3a71a93d8090ca4792636d620cab74693c8d780764cf87e1b197e971c8ab334af')

depends=(
    "python"
    "python-click"
    "python-typing_extensions"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-setuptools-scm"
    "python-wheel"
)

build () {
    cd "$srcdir/$_name-$pkgver" || exit
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
        python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
