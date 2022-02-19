# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy
pkgver=3.0.5
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-requests' 'python-click')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-waybackpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c33b9e6570cc380d93b641c60257791580fb1acaa6c8aa5a2c95f5187c567227')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
