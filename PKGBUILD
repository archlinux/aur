# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
pkgver=3.6.0
pkgrel=4
pkgdesc="Utilities jointly used by devpi-server and devpi-client"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=('python-lazy' 'python-py' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/devpi-common/devpi-common-$pkgver.tar.gz")
sha256sums=('fc14aa6b74d4d9e27dc2e9cbff000ed9be5cd723d3ac9672e66e4e8fce797227')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  pytest -x
}

package() {
  cd "$pkgname-$pkgver"
  python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
