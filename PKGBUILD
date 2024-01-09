# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=pylibjpeg
pkgname=python-pylibjpeg
pkgver=2.0.0
pkgrel=1
pkgdesc='A Python framework for decoding JPEG images, with a focus on supporting pydicom'
arch=(any)
url='https://github.com/pydicom/pylibjpeg'
license=(MIT)
depends=(
  python-numpy
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
optdepends=(
  python-pylibjpeg-libjpeg
  python-pylibjpeg-openjpeg
  python-pylibjpeg-rle
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pydicom/pylibjpeg/archive/v${pkgver}.tar.gz")
sha512sums=('c72342de7d6952a41712944fb223d0fb1b016bae1b49a835701bd5f3647d4982f194b4cdb5a9a18bc5f95ecebba03f65041b4a774753b4b8723571603da2d979')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENCE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "${pkgdir}${site_packages}/pylibjpeg/tests"
  rm -rf "${pkgdir}${site_packages}/pylibjpeg/tools/tests"
}
# vim:set ts=2 sw=2 et:
