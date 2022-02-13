# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=17.10.1
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(python-argparse-addons python-humanfriendly python-pyelftools)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('25f698ff3ff86a4299e56ecefcb077a1f6815b12d454a8d57cde0e42d6de700c629fc74500b9450a6c77c82b7e447ef8a09cc007a35af38639aede70bdd3858b')
b2sums=('d17876ab8b54b703801c3ff76b58e5ff7053bb8afdfa8eab73113cae28590c6dfdf55251f4fc0e181385ce2c0ec8208ea7bfec2a73fee0e464fc0a394bd5954c')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
