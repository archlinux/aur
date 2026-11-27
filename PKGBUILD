# Maintainer: czyt <czytcn@gmail.com>
pkgname=nmem-cli
pkgver=0.10.125
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
sha256sums_x86_64=('d81e02a39da2f0ea0af9f66076e3d6d511372ce5d7ad9c3477a57bc5522eb012')
sha256sums_aarch64=('00fbc65fdfce15fc98a744c5e4ffb13915429628939b60341b8f4318ac77dd1e')

package() {
  local wheel_var="_wheel_${CARCH}"
  local wheel="${!wheel_var}"
  local binary="nmem_cli-${pkgver}.data/scripts/nmem"

  install -d "${pkgdir}/usr/bin"
  bsdtar -xOf "${srcdir}/${wheel}" "${binary}" > "${pkgdir}/usr/bin/nmem"
  chmod 755 "${pkgdir}/usr/bin/nmem"
}
