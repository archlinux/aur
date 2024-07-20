# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=python-gtts
_name=gTTS
pkgver=2.5.2
pkgrel=1
pkgdesc="Python library and CLI tool to interface with Google Translate's text-to-speech API"
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-click' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-testfixtures')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d9033d378eabd751d442f5220cff9ece3b2cd965ebdba8a7cdadf6dedc30b35')

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

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
