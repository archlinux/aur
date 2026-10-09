# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.98
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
sha256sums_x86_64=('ad179815ebd50d3af42990a6e931dd6eed567a5321da39aecf8a0b7baac094df')
sha256sums_aarch64=('b5502906d5bfebfb7eb665bd4ff6c137008f9ea179a7589bb3cdc83f68630148')

package() {
  local wheel_var="_wheel_${CARCH}"
  local wheel="${!wheel_var}"
  local binary="nmem_cli-${pkgver}.data/scripts/nmem"

  install -d "${pkgdir}/usr/bin"
  bsdtar -xOf "${srcdir}/${wheel}" "${binary}" > "${pkgdir}/usr/bin/nmem"
  chmod 755 "${pkgdir}/usr/bin/nmem"
}
