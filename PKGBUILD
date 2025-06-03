# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=cynthion-firmware-bin
_pypi_name=cynthion
pkgver=0.2.2
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
  "${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pypi_name::1}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz"
)

sha512sums=('ac24a6cf5d25672aad0f25c05fa2c6de0270d590854e87574de01825fbe47c0272b3d2067920cb125b88e548937622a3df31809fceba292e3feeeec94ea4c5bf')

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
