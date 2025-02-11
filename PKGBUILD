# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Matt Kasun <matt at netmaker.io>

_pkgname="netclient"
pkgname="${_pkgname}-bin"
pkgver=0.30.0
pkgrel=1
pkgdesc="Platform for modern, blazing fast wireguard virtual networks"
arch=('x86_64' 'aarch64' 'armv5h' 'armv6h' 'armv7h' 'mips' 'mipsel')
url="https://docs.netmaker.io/${_pkgname}.html"
_url="https://github.com/gravitl/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/v${pkgver}/LICENSE.txt"
		    "${_pkgname}.service") # https://github.com/gravitl/netclient/blob/develop/daemon/systemd_linux.go
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/netclient-linux-amd64")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/netclient-linux-arm64")
source_armv5h=("${_pkgsrc}-armv5h::${_url}/releases/download/v${pkgver}/netclient-linux-armv5")
source_armv6h=("${_pkgsrc}-armv6h::${_url}/releases/download/v${pkgver}/netclient-linux-armv6")
source_armv7h=("${_pkgsrc}-armv7h::${_url}/releases/download/v${pkgver}/netclient-linux-armv7")
# Change 'hardfloat' to 'softfloat' if necessary
source_mips=("${_pkgsrc}-mips::${_url}/releases/download/v${pkgver}/netclient-linux-mips-hardfloat")
source_mipsel=("${_pkgsrc}-mipsel::${_url}/releases/download/v${pkgver}/netclient-linux-mipsle-hardfloat")
sha256sums=('e8eb274cbb1d0a59d88489ffb6f8b9231b00553d8d56bebcf83cb1bb9b3d3334'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'cc1f897a4c6055ceaa65452817641fc14a5b061848f95772363c54d1d42f7a46')
sha256sums_x86_64=('c140b66003ba48a97f4a5a3a1728a79d527049737eacb003cd54daada450dd90')
sha256sums_aarch64=('2c678ac284b55fdc08f2e575171612d6b4de4c44ae45dec31d14ead944f9a3e2')
sha256sums_armv5h=('50a83679d9443c64671565e6d00628a5e65a520788a218cd57f26f72251bbc39')
sha256sums_armv6h=('3e8d29d1b64f685fcdcea49cbc73e721f1bf82eafdc746d4121d251d6c44f3f1')
sha256sums_armv7h=('c0ea6cb7a6e7b62830b7eadbbc4003039aaeac0178b2a0605de4dc94c31a2601')
sha256sums_mips=('05b1d009184d0a7b983498b06043490da17d65bee8fe0dea90466b7a896a608b')
sha256sums_mipsel=('ce3f6b8eceee22c472dc797a7b8d37932890bdf452748f27a8766bc85863b7fd')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
