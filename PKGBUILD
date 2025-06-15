# Maintainer: hengtseChou <hankthedev@gmail.com>
pkgname=aur-sync-vote
pkgver=0.1.0
pkgrel=4
pkgdesc="Automates voting on installed and uninstalled AUR packages"
arch=('any')
url="https://github.com/hengtseChou/aur-sync-vote"
license=('MIT')
depends=('python-beautifulsoup4' 'python-html5lib' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5908f2629a18f9868f8d2a72892372bb4b5884bc2699228e32eeca2d04270283')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
