# Maintainer: Charlie Yu (charlieyu4994) <charlieyu4994@outlook.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=liteiclink
pkgname=python-$_pkgname
pkgver=2025.08
pkgrel=1
pkgdesc='Small footprint and configurable Inter-Chip communication cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD-2-Clause')
depends=('python' 'python-pyyaml' 'python-migen' 'python-litex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6837565aa8e496c7789ae59b6fefc8c42f3a4510b6d29d6fef0ac8fb83090f77')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  #no way to check need liteeth but liteeth need liteiclink
  #pytest test
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set et ts=2 sw=2 syntax=PKGBUILD: