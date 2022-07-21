# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
_name_=pylink
pkgname=python-pylink-square
pkgver=0.14.0
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(python-future python-psutil python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-mock python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
# sdist on pypi.org has no tests: https://github.com/square/pylink/issues/119
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name_-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('23f2d1d44687678ce225995123c8700bf829c6e1ace5a58743e85fea47c417aae88072a07a1f6f09646b8e0b764f4477a1b4dfc6fba3a861419b014988f8487d')
b2sums=('4a92992bb899b5073b34c248f3ee6682c9208e9f2d2a2b0962c6ec20f2a261e5259c0f02d448b53cb347523113ee384116b2f16efee02ed19fa6ad5a61021cba')

build() {
  cd $_name_-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name_-$pkgver
  pytest -v
}

package() {
  cd $_name_-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
