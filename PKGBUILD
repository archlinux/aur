# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=1.1.0
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
b2sums=('454dc09d6787d7ef0b1f66ade38124cb953adb5d531f826c82ef6d1d06c3881c75a768a62441d81bd9b8720301d822a6a3bf1b947352195db888c2a5c93de4ae')


build() {
	cd siun-"${pkgver}"
	rye build --wheel
}

package() {
  cd siun-"${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
