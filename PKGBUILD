# Maintainer: Phillip Dykman <phil.d324@gmail.com>
pkgname=keeenv
# renovate: datasource=github-tags depName=scross01/keeenv
pkgver=0.6.0
pkgrel=1
pkgdesc='Set local environment variables from a KeePass database'
arch=('any')
url="https://github.com/scross01/$pkgname"
license=('MIT')
depends=('python' 'python-pykeepass')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c6d99ac1511114f67639d8d312001fd42f09c3727853a6562272c9eaa26ff658')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
