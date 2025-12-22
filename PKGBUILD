# Maintainer: acaibowlz <hankthedev@gmail.com>
pkgname=aur-sync-vote
pkgver=0.2.1
pkgrel=1
pkgdesc="Automates voting on installed and uninstalled AUR packages"
arch=('any')
url="https://github.com/acaibowlz/aur-sync-vote"
license=('MIT')
depends=('python-beautifulsoup4' 'python-html5lib' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'gnome-keyring: provides org.freedesktop.secrets.service'
  'kwallet: provides org.freedesktop.secrets.service'
  'keepassxc: provides org.freedesktop.secrets.service'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91b90e465abb262fa253b2b5fb82fed88622a32cb5a68731584f629e01977d33')

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
