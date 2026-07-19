# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=python-falkordb
_name=${pkgname#python-}
pkgver=1.6.2
pkgrel=1
pkgdesc="Python client for interacting with FalkorDB database"
arch=('any')
url="https://github.com/FalkorDB/falkordb-py"
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-redis'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('73dbbd9df61c56f45cf2fe8b9028888ad4892712790ce4e40d7ceabe118609ae')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
