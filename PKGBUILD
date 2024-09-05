# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Matt Kasun <matt at netmaker.io>

_pkgname="netclient"
pkgname="${_pkgname}-bin"
pkgver=0.25.0
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
sha256sums=('815958cde7b1368d6a8b021a0b9aea5a8b1d0972252b9af5c17f5b6e1dfee786'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'cc1f897a4c6055ceaa65452817641fc14a5b061848f95772363c54d1d42f7a46')
sha256sums_x86_64=('89b2fb0e963a84da87f4cd13621563c97bcb714617b761c534c521255fa9952e')
sha256sums_aarch64=('575a8ee7dbb57eb3a944cfed0ee6547250508226d502b13e814df8fbc21774e0')
sha256sums_armv5h=('5c518413435cb87b30191eb11035f14abde2883f51c94443414ad8caa1fd0d92')
sha256sums_armv6h=('79380d14369f04fc2bde47fba46957277bdeaf10ae2ca8402f1236efc09170a6')
sha256sums_armv7h=('d595096c90edad20fb3a33ccb61b59c9f00aa6bcd6a98e2edd4291aabdc97f22')
sha256sums_mips=('a3e906cf644a8ab69235efddf9abc7431ab3f150ecbdd1989e99505083568f30')
sha256sums_mipsel=('fd7e9253b78fa7fb9b52f885fae0698c72000e446504351414b2e147d40cf5e6')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
