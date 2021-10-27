# Maintainer: Donald Webster <fryfrog@gmail.com>
# Co-Maintainer: Joaquín Rufo Gutierrez <joaquinito2051@gmail.com>
pkgname=jackett-bin
pkgver=0.19.71
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('curl' 'openssl-1.0')
optdepends=(
  'flaresolverr: A proxy server to bypass Cloudflare protection'
)
options=('!strip' 'staticlibs')
provides=('jackett')
conflicts=('jackett')
source=("jackett.service"
        "jackett.sysusers"
        "jackett.tmpfiles")

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")

sha256sums=('9d8f9d73e5fa2b2877dde010c0d8ca6fbf47f03eb1f01b02f846026a949a0dcf'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1')
sha256sums_x86_64=('cc8fc68d01188a74041909ecfc4519c684aa7d0e277b6e24bc307b4e806fa438')
sha256sums_aarch64=('e17c6bdd97dc01d1570465d856131171e8e2fac715a358784bbe892f882871eb')
sha256sums_armv7h=('3acd3ff2e96db0f266e05cc7e6cb521b7908a5c4929a295c0c2a5b03dae87021')



package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
