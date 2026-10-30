# Co-Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Co-Maintainer: Joaquín Rufo Gutierrez <joaquinito2051@gmail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-bin
pkgver=0.24.2977
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
sha256sums_x86_64=('0a5e8fa93cdd58539fe2aecd2a90ea4022f1838f1bed3f8e8d8c6d151f62a3a2')
sha256sums_aarch64=('3a0c2232362b01b2a360f7ab927ecff1c47e9aeb84666f80e4b8eb4a642b6021')
sha256sums_armv7h=('24dc3b507fa17dabc4e245acd91ce6d4cf1a77150cf3cce8bf04ae4d5359b5ba')



package() {
    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
