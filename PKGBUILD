# Maintainer: David Runge <dvzrv@archlinux.org>

_name=tree-format
pkgname=python-tree-format
pkgver=0.1.2
pkgrel=1
pkgdesc="Python library for printing trees on the console"
arch=('any')
url="https://github.com/jml/tree-format"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-testtools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('386b1d5852d70623514c6284cb2d4b7abe10c7b3b39ba2aca321d3590a065ad7cf1390fd518f9792bfbb9c13730beaf3504c399e25d39494e95af564a0f5b639')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
