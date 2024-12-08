# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tun Win Naing <tunwn.mdy at gmail dot com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-mono
pkgver=0.22.1058
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://github.com/Jackett/Jackett'
depends=('bash' 'glibc' 'mono')
optdepends=(
  'flaresolverr: A proxy server to bypass Cloudflare protection'
)
options=('!strip' 'staticlibs' '!debug')
conflicts=('jackett')
provides=('jackett')

source=("jackett.service"
        "jackett.sysusers"
        "jackett.tmpfiles"
        "Jackett.Binaries.Mono-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.Mono.tar.gz")

sha256sums=('2eac076a27789c79447b290ee904bdabe65af4617e97fd8fe4177db097e08e8e'
            'f865c06ffd21a12d37bf05953d9b483819c0f4e43d243a56db33986113fc40e4'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1'
            '3e72eb77a10f7a4f430ffa8a73634df3c349e3a468769cae0819b36e98facdbe')

package() {
    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
