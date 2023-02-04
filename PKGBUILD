# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contribuor: Jonian Guveli <https://github.com/jonian/>
pkgname=python-gtts
_name=gTTS
pkgver=2.3.1
pkgrel=1
pkgdesc="Python library and CLI tool to interface with Google Translate's text-to-speech API"
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-click' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-testfixtures')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e3764195ccb210b313ba6662083aa85e5cb39a918078048322227c46d3440a0a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
