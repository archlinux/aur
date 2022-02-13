# Maintainer: David Runge <dvzrv@archlinux.org>

_name=argparse_addons
pkgname=python-argparse-addons
pkgver=0.7.0
pkgrel=2
pkgdesc="Additional Python argparse types and actions"
arch=(any)
url="https://github.com/eerimoq/argparse_addons"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('0bc0c3e5d81ff79345ebb41b9a37d539b3923f5fb0fcd63dcb701108b89fc0df686653a43cee66e2a61bc667b207da8af4335a7ac175fd7e2e14c517cf7e358e')
b2sums=('bff17194a18122e4cb8146d6888cc10636d6e5a3a65d3c4f44de6fa447031052182e08673dd321f71c5b681c18fb361d09ed1252d5ba3424badb939f1053797b')

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
