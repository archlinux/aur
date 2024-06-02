# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>

_name=browserxt
pkgname=python-browserxt
pkgver=0.2.1
pkgrel=0
epoch=0
pkgdesc="A simple eXTensible Browser runner"
arch=(any)
url="https://github.com/punkops/browserxt"
license=(MPL2)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-pdm
)
checkdepends=(
  git
  python-pytest
  python-setuptools
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
sha256sums=('0c6d5fd9c03d63847127552499e2b157038f335f3aa568c0f8a5688df92633e4')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
