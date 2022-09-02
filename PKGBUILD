# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=17.10.3
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(python-argparse-addons python-humanfriendly python-pyelftools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('23d944e4e18a93153cfd6d214c3d437c2462aeb2e7cee7ffc82e5bfe0cb7e052bdaaf62fee0f963d3e135324dc1cdc2b50ad59e3e4b5174e9df1c91c8f8b673e')
b2sums=('128b1095d80e3a93078d774cda3364709d13604b8f6561b1e34fcf27a1794cfc3f339a0efceeac8ab9e83b8d73793c24cd0bf02b30a0702ba321ba238f2cdd91')

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
