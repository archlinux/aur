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
sha256sums_x86_64=('2a8be0246738ecf52211e1bf71cae00ee062f642c1f0517f814cc9a7de879405')
sha256sums_aarch64=('e89ab3bd6578633a150208243fa342e37db46af18a0645b18719ad832b0f5379')
sha256sums_armv5h=('c638130fd8b6c2925821db5ae83c06a2f59a04664cdb28d2541795bad3e76e31')
sha256sums_armv6h=('042c3c4880a05419fd6c46f110777e33c87f6ae49b02509a4676c372377a1cc6')
sha256sums_armv7h=('d811fd190e8baf8ab426edb549c9e51e9c12c9a725b0f99db3d8bc7d0c22530f')
sha256sums_mips=('e6fd4a6ecbc5f7d8e067606c306fc1b829cb8cec8e40ea56b6c94cc0e21bcb2e')
sha256sums_mipsel=('107468bd6c5a87d37db1ca08a7250eaaed7e946e9b4ebaa5f55f3c4c0d797f37')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
