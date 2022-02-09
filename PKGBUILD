# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy
pkgver=3.0.3
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-requests' 'python-click')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
provides=('python-waybackpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8b1520c385f669b78afe3659fa0106a100032c02cd5adac7cdb315ccc756c9dc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname-$pkgver"
  python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
