# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-error-helper
_name=${pkgname#python-}
pkgver=1.5
pkgrel=1
pkgdesc="Minimalistic python module to print colorful messages"
url="https://github.com/30350n/error_helper"
depends=(
    'python'
)
makedepends=(python-build python-installer python-hatchling)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('ee46f31a689db19ce1a04e69f437639faa0373e1d4ce4374db2912d1ed09a1d6')

build() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
