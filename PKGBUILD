# Co-Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Co-Maintainer: Joaquín Rufo Gutierrez <joaquinito2051@gmail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-bin
pkgver=0.24.2225
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
url='https://github.com/Jackett/Jackett'
depends=('bash' 'zlib' 'glibc' 'gcc-libs')
optdepends=(
  'flaresolverr: A proxy server to bypass Cloudflare protection'
)
options=('!strip' 'staticlibs' '!debug')
provides=('jackett')
conflicts=('jackett')
source=("jackett.service"
        "jackett.sysusers"
        "jackett.tmpfiles")

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")

sha256sums=('4cb8d61d3a7a85595af0d347e14729056cecdcbd96640a10ba7c0c02da4a3741'
            'f865c06ffd21a12d37bf05953d9b483819c0f4e43d243a56db33986113fc40e4'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1')
sha256sums_x86_64=('2ea45cdfe019bfaffc638d62cb22dd85e8706e3ce4e192f3af04c8efb4b6f632')
sha256sums_aarch64=('10d2fe8e81cbcca2540e25b19cb9ba58d78944388403c41d66ae201304db79af')
sha256sums_armv7h=('7d12a082c5a657374c1fa3afd08468d43ef82137a6f746607081c35d28898cab')



package() {
    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
