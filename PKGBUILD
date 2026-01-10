# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname='python-cymruwhois'
pkgver=1.6
pkgrel=7
pkgdesc='Client for the whois.cymru.com service'
arch=('any')
url='https://pythonhosted.org/cymruwhois'
license=('MIT')
depends=('python')
optdepends=(
  'python-memcached: optional caching in memcached'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JustinAzoff/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('357bd4beaab4c857062984cfd6b85606e3ff6b39e6e5420f428961ab2a9f2434')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
