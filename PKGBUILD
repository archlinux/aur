# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=socid-extractor
pkgver=0.1.1
pkgrel=1
pkgdesc="Extract account identifiers and metadata from personal pages"
arch=(any)
url="https://github.com/soxoj/socid-extractor"
license=(MIT)
depends=(
  python
  python-beautifulsoup4
  python-dateutil
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$pkgname/socid_extractor-$pkgver.tar.gz")
sha256sums=('a7013008ff4aeaedb24e0899318e2d5cbf1b395f9945db1495c720fa5823ded1')

_archive="socid_extractor-$pkgver"

latestver() {
  curl -fsSL "https://pypi.org/pypi/$pkgname/json" | jq -r '.info.version'
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

# Current tests interact with actual websites rather than mock ones, so test
# results are highly unstable. Skipping testing for that reason.
# check() {}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
