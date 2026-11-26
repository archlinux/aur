# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.124
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
sha256sums_x86_64=('399f498e1e146b2e79846bd5bbafd7a420e090148433de35ec04e177117216e3')
sha256sums_aarch64=('c4bd25ed0166b9a4010c3daf853d77efc0fe1649b69aa8e962851c41d8c129e6')

package() {
  local wheel_var="_wheel_${CARCH}"
  local wheel="${!wheel_var}"
  local binary="nmem_cli-${pkgver}.data/scripts/nmem"

  install -d "${pkgdir}/usr/bin"
  bsdtar -xOf "${srcdir}/${wheel}" "${binary}" > "${pkgdir}/usr/bin/nmem"
  chmod 755 "${pkgdir}/usr/bin/nmem"
}
