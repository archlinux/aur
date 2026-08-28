# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=python-falkordb
_name=${pkgname#python-}
pkgver=1.7.1
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
sha256sums=('09dd89dfb668c6fe7741c0ec67fcdb5c7a4b009e87f065a644199170f4fa5766')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
