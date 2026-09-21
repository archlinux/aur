# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-materialsdb
_name=python-materialsdb
pkgver=0.3.2
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
sha256sums=('00c28b51901a27efc3d2cb24a2acdefbc7e2a36a9607869f97f453624ef756cb')
build() {
    cd "${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
