# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.57
pkgrel=1
pkgdesc="CLI and TUI for Nowledge Mem - AI memory management"
arch=('x86_64' 'aarch64')
url="https://mem.nowledge.co/docs/cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
options=('!debug' '!strip')

_wheel_x86_64="nmem_cli-${pkgver}-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
_wheel_aarch64="nmem_cli-${pkgver}-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
source_x86_64=("${_wheel_x86_64}::https://files.pythonhosted.org/packages/py3/n/nmem-cli/${_wheel_x86_64}")
source_aarch64=("${_wheel_aarch64}::https://files.pythonhosted.org/packages/py3/n/nmem-cli/${_wheel_aarch64}")
noextract=("${_wheel_x86_64}" "${_wheel_aarch64}")
sha256sums_x86_64=('5c72ed269ee4876d418a6cd886b811abc870d044b34bb1ec8f1b10ab286f2d88')
sha256sums_aarch64=('35dc7b42c78b848dee877ac2b3b74e1cfd64c03dc4af844738b6c098fab6e15c')

package() {
  local wheel_var="_wheel_${CARCH}"
  local wheel="${!wheel_var}"
  local binary="nmem_cli-${pkgver}.data/scripts/nmem"

  install -d "${pkgdir}/usr/bin"
  bsdtar -xOf "${srcdir}/${wheel}" "${binary}" > "${pkgdir}/usr/bin/nmem"
  chmod 755 "${pkgdir}/usr/bin/nmem"
}
