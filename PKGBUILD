# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Shatunov <me@aur.rocks>

_Name="FerretDB"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="A proxy that converts MongoDB queries to SQL and uses PostgreSQL as the database engine"
arch=('aarch64' 'x86_64')
url="https://www.ferretdb.com"
_url="https://github.com/${_Name}/${_Name}"
license=('Apache-2.0')
provides=("${_pkgname}" 'mongodb')
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgname}@.service"
        "${_pkgname}.target"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('42647180a997b9262381509839fd48a67090071fd92e36b2c4d9ce298eed4cc0'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '4eb4bdc57906cb1d06a68aeaec47834d7c3df5f928ed40cc0a1fec3097183534'
            '69123ae494b201311bf053e109fad0a539549937aab1ec3777a557762cbbabeb'
            'c832b3591708948a205d5625900b84f359a01213edc2f44e8c725997c52d995d'
            'e4e1239ca097f1e45c453a847c6f3ba4a0f5830ab031c3e085261326e45bccb1')
sha256sums_aarch64=('9608029378bcbf1d6af1e67d57b578d61a9250661e6b8e39d3dd8960ee128ba8')
sha256sums_x86_64=('c444a6c9823883dc611452245dcbd82e9bbc788826a3480b828be2c93d8a857a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -vDm644 "${_pkgname}.target"   "${pkgdir}/usr/lib/systemd/system/${_pkgname}.target"
	install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
