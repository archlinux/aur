# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-modernize
_name="${pkgname#python-}"
pkgver=0.8.0
pkgrel=1
pkgdesc="Code modernizer for migration to python 3 built on fissix (fork of lib2to3)"
arch=(any)
url="https://github.com/PyCQA/modernize"
license=('LicenseRef-python-modernize')
depends=(
  python
  python-fissix
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1672b4bb19a060a53dd0518cc8f70fc83591c7246e532223459f85d338c60f55')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
