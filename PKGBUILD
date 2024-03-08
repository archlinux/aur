# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-lazrs
pkgdesc="Python bindings for laz-rs (LAZ compression)"
pkgver=0.5.3
pkgrel=1
url='https://github.com/laz-rs/laz-rs-python'
arch=('x86_64')
license=('MIT')

depends=('gcc-libs' 'glibc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-maturin')

_pypi=lazrs
source=(
  "git+https://github.com/laz-rs/laz-rs-python.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd laz-rs-python
  python -m build --no-isolation --wheel
}

check() {
  cd laz-rs-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver-"*.whl
  test-env/bin/python -c 'import lazrs'
}

package() {
  cd laz-rs-python
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
