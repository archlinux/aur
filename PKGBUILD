# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=udtools
pkgname="python-${_pkgname}"
pkgver=0.2.7
pkgrel=1
pkgdesc="Python tools for Universal Dependencies"
arch=('any')
url="https://github.com/UniversalDependencies/tools"
license=('GPL-2.0-or-later')
depends=(
    'python'
    'python-udapi'
    'python-regex'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('423396ececa70e2903c2c7cc1e6a259716122550cf41f77c1c2261ee27852213')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
