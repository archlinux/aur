# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Shatunov <me@aur.rocks>

_pkgname="ferretdb"
pkgname="${_pkgname}-bin"
pkgver=1.23.1
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
sha256sums_x86_64=('f8141bf02874b4b1583a7927423e6c713ab95947b617e575b9eebf0804dd9e10')
sha256sums_aarch64=('b588462d94d0a04b5dce45d5fd042f7d008e8c3c915a7da63a3710ac7e4da22e')
sha256sums_armv7h=('b448845103c0d481fd2ef22c0d90f996696133b9f193595cd32794ad45ea1caa')

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
