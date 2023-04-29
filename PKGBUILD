# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=python-gtts
_name=gTTS
pkgver=2.3.2
pkgrel=1
pkgdesc="Python library and CLI tool to interface with Google Translate's text-to-speech API"
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-click' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-testfixtures')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('90dbdd49aadac924176e8e8337cfd50156dd2e10e7f4ee7ef59f7c6089a6b6c3')

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
