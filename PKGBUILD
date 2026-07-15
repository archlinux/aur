# Maintainer: pentago <pentago@users.noreply.github.com>

pkgname=spec-kit
pkgver=0.12.16
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7e74983a92b595711eea57eead5062c7d032cfb67936b043ae37f863ba6fd43f4072a9d2a87c83eb6137054531da4f377cc94c54fce14e5e13b050fd9d9231ac')

build() {
  cd "spec-kit-$pkgver"
  python -m build --wheel --no-isolation
}


package() {
  cd "spec-kit-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md CHANGELOG.md
}
