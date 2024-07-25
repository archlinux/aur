# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Shatunov <me@aur.rocks>

_pkgname="ferretdb"
pkgname="${_pkgname}-bin"
pkgver=1.23.0
pkgrel=1
pkgdesc="A proxy that converts MongoDB queries to SQL and uses PostgreSQL as the database engine"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.${_pkgname}.com"
_url="https://github.com/FerretDB/FerretDB"
license=('Apache-2.0')
provides=("${_pkgname}" 'mongodb')
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/v${pkgver}/LICENSE"
        "${_pkgname}@.service"
        "${_pkgname}.target"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_armv7h=("${_pkgsrc}-armv7h::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-armv7")
sha256sums=('9cf47a729f549108eba8eb574cdfe00a555c1a30c2d9f85a2ccd16a45cfdbdc8'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '4eb4bdc57906cb1d06a68aeaec47834d7c3df5f928ed40cc0a1fec3097183534'
            '69123ae494b201311bf053e109fad0a539549937aab1ec3777a557762cbbabeb'
            'c832b3591708948a205d5625900b84f359a01213edc2f44e8c725997c52d995d'
            'e4e1239ca097f1e45c453a847c6f3ba4a0f5830ab031c3e085261326e45bccb1')
sha256sums_x86_64=('fa0615a28f938ff2f4876ff0ec5ebba6f472466f0454410166f6788eea1d834c')
sha256sums_aarch64=('9fce10a51d087268f682b28a5e86775a84f39601018e62cc8c4f77f0f0a7836d')
sha256sums_armv7h=('cee77d4e45aba4fc62a9345111c8b923c86b4b6edf36e926bd2dc7d5420c69e7')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -Dm644 "${_pkgname}.target"   "${pkgdir}/usr/lib/systemd/system/${_pkgname}.target"
	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
