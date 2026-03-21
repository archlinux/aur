# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.15.1
pkgrel=1
pkgdesc="Command line tool to download pictures, videos and metadata from Instagram"
arch=('any')
url="https://instaloader.github.io/"
license=('MIT')
groups=()
depends=(
  python
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-browser-cookie3: Import session cookies from browser'
)
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/instaloader/instaloader/tar.gz/v$pkgver)
sha512sums=('1b53cc8d2ecc15898b88cd20163a67feeaa40cc4417ece7067a02c4f7943f14d2058a8861c201b6db356731193aa7136a4b5cfd67e0ef7a26ef36b43ca0bf0ac')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python -m installer --destdir="$pkgdir" dist/*.whl
}
