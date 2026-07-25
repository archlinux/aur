# Maintainer: acaibowlz <hankthedev@gmail.com>
pkgname=aur-sync-vote
pkgver=0.3.0
pkgrel=1
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
sha256sums=('424b868796d8c995312208669331a4246df21761b7e603a7c6e04b1f6a953cdb')

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
