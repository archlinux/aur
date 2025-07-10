# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Matt Kasun <matt at netmaker.io>

_pkgname="netclient"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Platform for modern, blazing fast wireguard virtual networks"
arch=('x86_64' 'aarch64' 'armv5h' 'armv6h' 'armv7h' 'mips' 'mipsel')
url="https://docs.netmaker.io/docs/client-installation/netclient"
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
sha256sums=('89b6b65981cb9b8295c1f7fead8363b25d9d65057d648e89f91c39a44daf0e1c'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'cc1f897a4c6055ceaa65452817641fc14a5b061848f95772363c54d1d42f7a46')
sha256sums_x86_64=('6945318f253dd9ceb6c05c9c5047c6226c3a8aee2da75692143f1c58c52a2e0e')
sha256sums_aarch64=('d2ee7316e9109acefaa0c751e8f353c61aa4ab4093aa58d257f9b5be7c8aa071')
sha256sums_armv5h=('c7a98277eb6825d29c8cb3223c87c0327030f4d06e598d8a151c31a68b37d444')
sha256sums_armv6h=('b3aeb5090e10101fe1af35d9b0915f81e1417e14c6c24d1feacd07c71045f91d')
sha256sums_armv7h=('c149798bf9d7800133f4a7864fa6b22e2aba41a73b2cf688f7291dad0565ccec')
sha256sums_mips=('276c84d7215c290d13b4846a34ab55a7a2d947d54d37666635e391cb0fea7801')
sha256sums_mipsel=('c26dab7ed70f0c32b76bc3ffd4442599f04aa8aab7878b9781f40f14e2170a47')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
