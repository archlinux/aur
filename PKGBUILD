# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
_name_=pylink
pkgname=python-pylink-square
pkgver=0.14.2
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
sha512sums=('bb285843753cab0f74bf99c6fe8c18b0123ec7926def04ac5cd8566cbf9c5d91335140c292ca75d6685e12f35060dad55eb48077d66ad16c72ba24237a5c5512')
b2sums=('d1dae1d08e7bdc187a423d949c4993ea1946c139c4386c9cc14327dc19d67942abf537f4e92af4354f8365d51856e6bf3909dd709487096d84e1d2b200b5fdc5')

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
