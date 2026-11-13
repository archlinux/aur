# Maintainer: Phillip Dykman <phil.d324@gmail.com>
pkgname=keeenv
# renovate: datasource=github-tags depName=scross01/keeenv
pkgver=0.7.0
pkgrel=1
pkgdesc='Set local environment variables from a KeePass database'
arch=('any')
url="https://github.com/scross01/$pkgname"
license=('MIT')
depends=('python' 'python-pykeepass')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('568d228d0119fb5261c7b00a41edcbc81b18a1d67d3e08e50b97c3ee7a6748a0')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
