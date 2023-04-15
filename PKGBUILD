# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tun Win Naing <tunwn.mdy at gmail dot com>
# Contributor: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-mono
pkgver=0.20.3906
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('mono')
optdepends=(
  'flaresolverr: A proxy server to bypass Cloudflare protection'
)
options=('!strip' 'staticlibs')
conflicts=('jackett' 'jackett-armv6-bin')
replaces=('jackett' 'jackett-armv6-bin')
provides=('jackett')

source=("jackett.service"
        "jackett.sysusers"
        "jackett.tmpfiles"
        "Jackett.Binaries.Mono-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.Mono.tar.gz")

sha256sums=('c5605e488bb113452b0bd6e6a7420ea5be8ffd7807cc06cbb6eb6277937c7da8'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1'
            'd6848cfbf51faa2735d15b769c8737af9edd2551ba93cc1edb6766e934a82ad4')

package() {
    cd "${srcdir}"

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
