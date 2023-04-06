# Maintainer: David Runge <dvzrv@archlinux.org>

_name=argparse_addons
pkgname=python-argparse-addons
pkgver=0.12.0
pkgrel=2
pkgdesc="Additional Python argparse types and actions"
arch=(any)
url="https://github.com/eerimoq/argparse_addons"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('31cdbf8d6a227068559d9c7cfb0e135851db40d029020c7825787d985b2de2aeb460d7ff87d09eea4c6ddc29b16000c43944b6ad754e877b45a217186eb34967')
b2sums=('5d77203ea93a3488f64ecba28714956a73ad8813d5635eb169e21b0198a5ac2645156208fc64730fbf5f1edd1ce08b5d15494079050851293b7364892e8c481a')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
