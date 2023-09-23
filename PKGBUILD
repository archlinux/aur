# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=19.0.0
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(
  python
  python-argparse-addons
  python-humanfriendly
  python-pyelftools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('3bc16d5f6c8fbcbf9b24ca5328046510fc96a2e34dbfeb6b15fe386330ed635093b250f71ae44b7b74b9003b0b005a353145194e371e97fb4b84474ae15bc8a2')
b2sums=('1daa66771cc68cd8b4d831a1d416b0bf1de60516cc4214bc4c13d52e363b37e0caee13463d67937a3393d28f73fbdb478daf7374817e3362f9cf9d8665aa7d36')

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
