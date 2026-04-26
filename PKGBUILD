# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jingbei Li <i@jingbei.li>
_base=installer
pkgname=pypy3-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="A low-level library for installing from a Python wheel distribution"
arch=(any)
url="https://${_base}.pypa.io"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-flit-core)
source=(${_base}-${pkgver}.tar.gz::https://github.com/pypa/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('6d222e9a81ae88b70682e45f1152fad0a7f197b5eda71671b178b78dcf944d7187329ae1856b6e8b93333711428b20d8c3ecdab0e1855b38602c3815ec5dfcdb')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m flit_core.wheel
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPATH=$(find dist -name 'installer-*.whl') pypy3 -m installer --destdir="$pkgdir" dist/${_base}-*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
