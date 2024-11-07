# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=1.0.0
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
b2sums=('942e014fa60e9b586ae6813a46784bfee23b6d0b855f0cb469190ecd49ab504ce91bdb835e3b9f7ea28579faa94db4cb4eca0f3dccec30cb31f7f7e6955c8aff')


build() {
	cd siun-"${pkgver}"
	rye build --wheel
}

package() {
  cd siun-"${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
