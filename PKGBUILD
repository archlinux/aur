# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=1.2.0
pkgrel=1
pkgdesc="siun stands for, and tries to answer, the question Should I upgrade now?"
arch=('any')
url="https://github.com/t4k1t/siun"
license=('MIT')
depends=(
  'python-click'
  'python-pydantic'
)
makedepends=(
  'rye'
)
provides=($_pkgname)
source=(https://github.com/t4k1t/siun/archive/refs/tags/v"${pkgver}".tar.gz)
b2sums=('fc75c426b5b694c799e099b6daf510ba60378e404145d340874db4189064fc1ea593012f2e4d56867bb1bc2fc7f0df06aa1e3ecb3a4cbbdde645bb982b6326d9')


build() {
	cd siun-"${pkgver}"
	rye build --wheel
}

package() {
  cd siun-"${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
