# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.121
pkgrel=1
pkgdesc="CLI and TUI for Nowledge Mem - AI memory management"
arch=('x86_64' 'aarch64')
url="https://mem.nowledge.co/docs/cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
options=('!debug' '!strip')

# PyPI renders the same two platform tags in whichever order the build used:
# manylinux2014_x86_64.manylinux_2_17_x86_64 since 0.10.111, the reverse
# before. The update workflow rewrites these two lines from the PyPI JSON API,
# so a change in tag order never needs a manual fix here.
_wheel_x86_64="nmem_cli-${pkgver}-py3-none-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
_wheel_aarch64="nmem_cli-${pkgver}-py3-none-manylinux2014_aarch64.manylinux_2_17_aarch64.whl"
# Short files.pythonhosted.org URLs redirect to the permanent hash path, so they
# keep working across releases without carrying a per-file hash.
source_x86_64=("${_wheel_x86_64}::https://files.pythonhosted.org/packages/py3/n/nmem-cli/${_wheel_x86_64}")
source_aarch64=("${_wheel_aarch64}::https://files.pythonhosted.org/packages/py3/n/nmem-cli/${_wheel_aarch64}")
noextract=("${_wheel_x86_64}" "${_wheel_aarch64}")
sha256sums_x86_64=('b4179a414d8a7dd8c12c3426f784cf86002dd72c841b7355f8598c33f025cee0')
sha256sums_aarch64=('0ffd199141566dc36086de24f13e8a625aaac5bc9292192e7aa9e122fe4820e1')

package() {
  local wheel_var="_wheel_${CARCH}"
  local wheel="${!wheel_var}"
  local binary="nmem_cli-${pkgver}.data/scripts/nmem"

  install -d "${pkgdir}/usr/bin"
  bsdtar -xOf "${srcdir}/${wheel}" "${binary}" > "${pkgdir}/usr/bin/nmem"
  chmod 755 "${pkgdir}/usr/bin/nmem"
}
