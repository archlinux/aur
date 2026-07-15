# Maintainer: pentago <pentago@users.noreply.github.com>

pkgname=spec-kit
pkgver=0.12.15
pkgrel=1
pkgdesc='Bootstrap and manage Spec Kit projects for Spec-Driven Development'
arch=('any')
url='https://github.com/github/spec-kit'
license=('MIT')
depends=('python'
  'python-click'
  'python-json5'
  'python-packaging'
  'python-pathspec'
  'python-platformdirs'
  'python-yaml'
  'python-readchar'
  'python-rich'
  'python-typer')
makedepends=('git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7e8d90abbcbea9cc2a97d84ad6c6988655550a8554ee1f99514030970219da93549e89451891a0c52cc5de4ebce7cf028c4432e7fca88b4195ea64ab5eb7d100')

build() {
  cd "spec-kit-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "spec-kit-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/pip install dist/*.whl
  test-env/bin/python -m pytest -v --no-header -rN
}

package() {
  cd "spec-kit-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CHANGELOG.md
}
