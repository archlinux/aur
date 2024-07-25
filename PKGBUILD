# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=cynthion-firmware-bin
_pypi_name=cynthion
pkgver=0.1.3
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

sha512sums=('233e2ae5c44eba56f154c8b01d60a535a7346563914d9bae7a373c11ba24e282af82ea9675f968e486bf1f90adfa73537a9134eedb6de11df8274efb854f5226')

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
