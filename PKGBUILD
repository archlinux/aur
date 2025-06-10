# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Matt Kasun <matt at netmaker.io>

_pkgname="netclient"
pkgname="${_pkgname}-bin"
pkgver=0.99.0
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
sha256sums=('6b5b15766ff984fa861ba5d6f59d869c1d8077f8797a1aae40e68d635d71524a'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'cc1f897a4c6055ceaa65452817641fc14a5b061848f95772363c54d1d42f7a46')
sha256sums_x86_64=('a572f5bfee230137d157a6e35eb814bdc223cf3758aea7b6ed3716e25a98374e')
sha256sums_aarch64=('c2b75217e9beed908fdb720a92b8e7b8814f5dee7cb8351b742bcf0d17f9f46e')
sha256sums_armv5h=('43edc5b45ea108e1699b38aa3d86bd1cd0573a93b82b84a68911c35094fb6756')
sha256sums_armv6h=('52942ae5df713c968e1590b9fe10a4f9db196482b85baf93f2d3e09a8888cee8')
sha256sums_armv7h=('213c2a26994f2aa42c93ba1c7397e241c567d197d7aa214e22fcd1406c58a84b')
sha256sums_mips=('5b963452f7132a4d6cdcb86fd6d63e1562cde2322ab9f333e1d51ad8af5c2b61')
sha256sums_mipsel=('ddd7c1dab4ae0126904ab3ee4d463799a9c8aab28e86a4d06d697bcb0bdc2af6')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
