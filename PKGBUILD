# Maintainer: Phil <42981905+PhilCauss@users.noreply.github.com>
pkgname=arx
pkgver=1.0.9
pkgrel=1
pkgdesc="A secure wrapper around yay (AUR) with LLM-based security analysis"
arch=('any')
url="https://github.com/PhilCauss/arx"
license=('MIT')
depends=(
  'python>=3.8'
  'python-openai>=1.0.0'
)

optdepends=('yay: required for functionality')


makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=68'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('57606005fccd460a74df03ff7627fb19695119bd200ca585f3e5d96b173ea611')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install license
 install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install default config file
  install -Dm644 config.ini "$pkgdir/etc/arx/config.ini"
  
  # Create user config directory
  install -dm755 "$pkgdir/etc/arx"
}
