# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.21.0
pkgrel=1
pkgdesc="Make your functions return something meaningful, typed, and safe"
arch=('any')
url="https://returns.readthedocs.io"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=(
  'python-pytest' 'python-pytest-mypy-plugins' 'python-pytest-subtests' 'python-pytest-randomly'
  'python-pytest-cov'
  'python-hypothesis' 'python-anyio' 'python-httpx' 'python-attrs' 'python-trio'
)
optdepends=(
  'mypy: For mypy compatibility'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dry-python/returns/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ede3ff7b310740ce97fdb63ad87847b4e7be4f0658d282ee62e1b88ed4c2675')
b2sums=('ac67bd4e6c867c3be6a1a3d8f610a2558654fbdebd70664f959dc2518eb9d4faff2e07c828bc30dc5bd4c8ea537905e5352a4d866c434039e5c5276b1748e47d')

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
