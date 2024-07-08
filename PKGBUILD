# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=cynthion-firmware-bin
_pypi_name=cynthion
pkgver=0.1.1
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

sha512sums=(
  'b6583a3c3010c2d59f3764dccd97f6f9a828e9e12fe0739411628398adfece6367ba63507c0c19a5e580e522caea3ef075dd7afca8aef6b389b382fca715f5fa'
)

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
