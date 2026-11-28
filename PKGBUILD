# Co-Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Co-Maintainer: Joaquín Rufo Gutierrez <joaquinito2051@gmail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-bin
pkgver=0.25.56
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=(x86_64 aarch64 armv7h)
license=('GPL-2.0-or-later')
url='https://github.com/Jackett/Jackett'
depends=(
  bash
  gcc-libs
  glibc
  zlib
)
optdepends=(
  'flaresolverr: A proxy server to bypass Cloudflare protection'
)
options=(!strip staticlibs !debug)
provides=(jackett)
conflicts=(jackett)
source=(
  jackett.service
  jackett.sysusers
  jackett.tmpfiles
)

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")

sha256sums=('4cb8d61d3a7a85595af0d347e14729056cecdcbd96640a10ba7c0c02da4a3741'
            'f865c06ffd21a12d37bf05953d9b483819c0f4e43d243a56db33986113fc40e4'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1')
sha256sums_x86_64=('c5c140ea858e9769796b96fb599cdcc4ae91836e6a13b1c398c1636a79e65f09')
sha256sums_aarch64=('46ed5496a77190c50a2319a45d140dac21e604f756b51655f6e258090ebaa47e')
sha256sums_armv7h=('ac3c4e77d580f709dad8ad5b45f54549a826a105f38b3f17e7cf16b31fac4026')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/lib/jackett/"
  cp -dpr --no-preserve=ownership "Jackett/"* "${pkgdir}/usr/lib/jackett/"

  install -Dm644 jackett.service "${pkgdir}/usr/lib/systemd/system/jackett.service"
  install -Dm644 jackett.sysusers "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
  install -Dm644 jackett.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
