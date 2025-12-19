# Maintainer: Charlie Yu (charlieyu4994) <charlieyu4994@outlook.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex
pkgname=python-$_pkgname
pkgver=2025.08
pkgrel=2
pkgdesc='Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs'
arch=('any')
url='https://github.com/enjoy-digital/litex'
license=('BSD-2-Clause')
depends=('python-migen' 'python-pyserial' 'python-requests' 'python-packaging' 'python-pythondata-software-compiler_rt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("0e70f0e3e4cf8b973296358771b0c0d6985df3bff18d642a297972de1c7a3483")

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  # only minimal testing will be performed
  pytest test/test_wishbone.py
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set et ts=2 sw=2 syntax=PKGBUILD: