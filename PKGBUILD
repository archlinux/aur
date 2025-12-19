# Maintainer: Charlie Yu (charlieyu4994) <charlieyu4994@outlook.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litescope
pkgname=python-$_pkgname
pkgver=2025.08
pkgrel=1
pkgdesc='Small footprint and configurable embedded FPGA logic analyzer core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD-2-Clause')
depends=('python' 'python-pyyaml' 'python-migen' 'python-litex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9cd0eea3b44f66fe0409a931607dd47686a3610044349ac380bd4c9464b467c2')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  #pytest test
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set et ts=2 sw=2 syntax=PKGBUILD: