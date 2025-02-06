# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=toml-adapt
pkgdesc="A very simple cli for manipulating toml files"
pkgver=0.3.4
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${pkgname}"
license=(MIT)
depends=(python-toml python-click)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
optdepends=('man-db: manual pages for toml-adapt')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a3f1e4099c0477005af3fb835a15a3e07a5a8155782b960e53fd571f93d767c63c817d7d12e846317dfe5a3695433cd3ea187ac1e9220e301cd890d98a8f5de4')

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
