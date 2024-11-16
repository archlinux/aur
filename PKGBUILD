# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=getkey
pkgname=python-getkey
pkgver=0.6.5
pkgrel=9
pkgdesc='Python library to easily read single chars and key strokes'
arch=('any')
url='https://github.com/kcsaff/getkey'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("https://github.com/kcsaff/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('096792463ed0cd8ac92d7b2b6d23cff1c815b449403115034bed2029b378d54c')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pkgname-$pkgver
  pytest --override-ini="addopts="
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove installed tests
  rm -r "$pkgdir$(python -c 'import site; print(site.getsitepackages()[0])')"/tests/
}
