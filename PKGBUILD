# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=cmakew
pkgver=0.2.0
pkgrel=6
pkgdesc="CMake wrapper CLI tool"
arch=('any')
url="https://github.com/thombashi/${pkgname}"
license=(MIT)
depends=(python-logbook python-subprocrunner python-typepy) # python-six
makedepends=(python-build python-installer python-setuptools python-wheel git)
source=("${pkgname}-${pkgver}::git+${url}.git?signed#tag=v${pkgver}")
validpgpkeys=('ACEC3954F31619D7288C17B07BAC46763C91BB7A') # Tsuyoshi Hombashi <tsuyoshi.hombashi@gmail.com>
sha512sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dvm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
