# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
pkgname=python-pylink-square
pkgver=0.14.3
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('30622abc506f3892d283fa6e0cd9709b8cf22564b6139ebb7d0a42abd6b3b37fcbc6e5c99a40de67721ce0852d9d0998682763c0b06c64e6725bf65d1c18d06c')
b2sums=('c009c46285bf6e1fb774c062a0c897e2b5915c071afb908ba1e297a89d42505b1d11b45af17053f218718ec8230df799b194fb3355e8053956c6346d638a0a34')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
