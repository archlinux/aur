# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Shatunov <me@aur.rocks>

_pkgname="ferretdb"
pkgname="${_pkgname}-bin"
pkgver=1.22.0
pkgrel=1
pkgdesc="A proxy that converts MongoDB queries to SQL and uses PostgreSQL as the database engine"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.${_pkgname}.com"
_url="https://github.com/FerretDB/FerretDB"
license=('Apache-2.0')
provides=("${_pkgname}" 'mongodb')
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_url}/raw/v${pkgver}/"{README.md,LICENSE}
        "${_pkgname}@.service"
        "${_pkgname}.target"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_armv7h=("${_pkgsrc}-armv7h::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-armv7")
sha256sums=('2d3a64c3d2042cef0cc3eacd2c8fb8a8b79b1c4c8b6b3f589abfeb8fd8bc2aec'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '9ab0c865a31ee9b4c1e4b282b846941ebe88ed55e27f159c1fc1a58f3d8bb191'
            '69123ae494b201311bf053e109fad0a539549937aab1ec3777a557762cbbabeb'
            'c832b3591708948a205d5625900b84f359a01213edc2f44e8c725997c52d995d'
            'e4e1239ca097f1e45c453a847c6f3ba4a0f5830ab031c3e085261326e45bccb1')
sha256sums_x86_64=('f68c6816cd9d576bc1c75acca889c5dcdc0aa135d78f34029c160175db09b128')
sha256sums_aarch64=('91b087bebb923fe5046eaac8e726e6b9fcc22c3095f2a6c82f32b86bd10cd003')
sha256sums_armv7h=('b286ccd876581b505b073550a9a63793eb9d79fed0516fd4899ca4d4a243c78b')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -Dm644 "${_pkgname}.target" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.target"
	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
