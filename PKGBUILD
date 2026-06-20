# Maintainer: acaibowlz <hankthedev@gmail.com>
pkgname=aur-sync-vote
pkgver=0.2.3
pkgrel=2
pkgdesc="Syncing votes with the currently installed AUR packages"
arch=('any')
url="https://github.com/acaibowlz/aur-sync-vote"
license=('MIT')
depends=('python-beautifulsoup4' 'python-html5lib' 'python-requests' 'python-keyring')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'org.freedesktop.secrets: password saving'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36f8b68bc6e7c42523e95f5a034f3476db9a3a00d1f2c656de4b94d17b86f12d')

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
