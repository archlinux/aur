# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>

_name=browserxt
pkgname=python-browserxt
pkgver=0.2.3
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
sha256sums=('cd6610c44401d1b1f799f89323c719250280ae9cd843c3b56623bbd1df425ce2')

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
