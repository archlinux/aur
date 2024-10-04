# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=cynthion-firmware-bin
_pypi_name=cynthion
pkgver=0.1.6
pkgrel=1
pkgdesc='Firmware for the Great Scott Gadgets Cynthion (pre-built from PyPI)'
arch=('any')
url='https://github.com/greatscottgadgets/cynthion'
license=('BSD-3-Clause')
optdepends=(
  'riscv64-linux-gnu-gdb: to debug the firmware over JTAG'
)
provides=("cynthion-firmware=${pkgver}")
conflicts=('cynthion-firmware')

source=(
  "https://files.pythonhosted.org/packages/source/${_pypi_name::1}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz"
)

sha512sums=('f53ca3429880ce74054c302d476da7d144818b1f7033c57ed5757b62f16e176fe3d64a0b400100693371924645d859dc11faf4f898d676d6b1b665c81e5b6638')

package() {
  cd "${_pypi_name}-${pkgver}"

  echo >&2 'Packaging binaries'
  install -D -m 644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" \
    assets/*.bin

  echo >&2 'Packaging bitstreams'
  cp -R --preserve=mode -t "${pkgdir}/usr/lib/${pkgname%-bin}" \
    assets/CynthionPlatform*

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
