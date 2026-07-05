# Maintainer: André Koch-Kramer <koch-kramer@web.de>

pkgname=instaloader
pkgver=4.15.2
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
sha512sums=('e9f7e58fd8cc6f9f4c1ba3d1737de450eda905543d25eefd7affa0c8703ee718e3f619da1b20e412706312a79c9504206b97df5aa1552c98a77c6f55691c88c5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python -m installer --destdir="$pkgdir" dist/*.whl
}
