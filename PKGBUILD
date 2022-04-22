# Maintainer: David Runge <dvzrv@archlinux.org>

_name=argparse_addons
pkgname=python-argparse-addons
pkgver=0.8.0
pkgrel=1
pkgdesc="Additional Python argparse types and actions"
arch=(any)
url="https://github.com/eerimoq/argparse_addons"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('254a22c6f3af85caba1bb499df5a607e4e4a70b5c9b263dcd9ef58b6e0844b40a017ed68d687c44609fb01e4c25c9fabcb9b9af2595bbeb4c85cededda871966')
b2sums=('0c80126f48e0eef129d8b29cddbbdb33951916b6af8f20c996e2d8b360b1dbcc614d5ad226cb8ff5bd1fa8f335b076466f77765fbc3c8e93ad59a61fc8e84294')

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
