# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-materialsdb
_name=python-materialsdb
pkgver=0.3.1
pkgrel=1
pkgdesc="A library to work with materialsdb.org open standard for building materials"
arch=('any')
url="https://github.com/CyrilWaechter/python-materialsdb"
license=('GPL-3.0-or-later')
depends=('python' 'python-lxml')
optdepends=(
    'ifcopenshell: for IFC conversion features'
)
makedepends=(
    python-build
    python-installer
    python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('eb5fa6ca3b884714b10ad2c149bb36121484be14456aaed377939bbd8ecdd3f7')
build() {
    cd "${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
