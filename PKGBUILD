# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.20.1
pkgrel=1
pkgdesc="Make your functions return something meaningful, typed, and safe"
arch=('any')
url="https://pypi.org/project/parsita"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mypy-plugins' 'python-pytest-subtests' 'python-pytest-randomly' 'python-hypothesis')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dry-python/returns/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8ae4dea988623699f0447f773a3f0a15409d4c96a39d7e3fa2c55c0391de438e')
b2sums=('89b8399c806380080a0a75c0b6c684a2a28349afcdf356d1a7e35ac3e667b643c9bdc8108fdcadc97bdd8c9981d504c1a35be07ea898be1ec174ce6ca29ef868')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  pytest
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
