# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=toml-adapt
pkgdesc="A very simple cli for manipulating toml files"
pkgver=0.3.2
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${pkgname}"
license=(MIT)
depends=(python-toml python-click)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
optdepends=('man-db: manual pages for toml-adapt')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ef39e03f30c5b5d1c4402e195fd62f369378a8f497da4b4b2284e75c1dc436ef95813242ecd68e8dd4a74da49f9fdae5fcf914c7abdd5f3d0033267221b02284')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${pkgname}.1 -t "${pkgdir}/usr/share/man/man1/"
}
