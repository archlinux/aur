# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=toml-adapt
pkgdesc="A very simple cli for manipulating toml files"
pkgver=0.2.12
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${pkgname}"
license=(MIT)
depends=(python-toml python-click)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
optdepends=('man-db: manual pages for toml-adapt')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('7c3e1e3ce7da1238e6ccee407b0396b1dab3712269b50ee7600931500a0715f0294e939b45dd8207f166006e9bebae98915a0cafcc8011670582bc23805015a6')

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
