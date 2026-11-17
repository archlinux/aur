# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.120
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
sha256sums_x86_64=('71c071274780c6f1c893068c9cb92c094ec88b9ef88d60ee520d9de936eb12ad')
sha256sums_aarch64=('ddddbaf29d97a280257050b9b9734eca2798e5939c1a5950a2a24638d3d5b68d')

package() {
  local wheel_var="_wheel_${CARCH}"
  local wheel="${!wheel_var}"
  local binary="nmem_cli-${pkgver}.data/scripts/nmem"

  install -d "${pkgdir}/usr/bin"
  bsdtar -xOf "${srcdir}/${wheel}" "${binary}" > "${pkgdir}/usr/bin/nmem"
  chmod 755 "${pkgdir}/usr/bin/nmem"
}
