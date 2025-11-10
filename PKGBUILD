# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sergey Shatunov <me@aur.rocks>
# Contributor: Nguyễn Quang Minh <minhnbnt@gmail.com>

_Name="FerretDB"
_pkgname="${_Name,,}"

pkgname="${_pkgname}-bin"
pkgver=2.7.0 # datasource=github-releases depName=FerretDB/FerretDB
pkgrel=1
pkgdesc='A proxy that converts MongoDB queries to SQL and uses PostgreSQL as the database engine'
arch=('aarch64' 'x86_64')
url='https://www.ferretdb.com'
license=('Apache-2.0')
provides=("${_pkgname}" 'mongodb')
conflicts=("${_pkgname}")

_url="https://github.com/${_Name}/${_Name}"
_pkgsrc="${_pkgname}-${pkgver}"

source=(
    "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
    "${_pkgname}@.service"
    "${_pkgname}.target"
    "${_pkgname}.sysusers"
    "${_pkgname}.tmpfiles"
)

source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-arm64-linux")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-amd64-linux")

sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '4eb4bdc57906cb1d06a68aeaec47834d7c3df5f928ed40cc0a1fec3097183534'
            '69123ae494b201311bf053e109fad0a539549937aab1ec3777a557762cbbabeb'
            'c832b3591708948a205d5625900b84f359a01213edc2f44e8c725997c52d995d'
            'e4e1239ca097f1e45c453a847c6f3ba4a0f5830ab031c3e085261326e45bccb1')
sha256sums_aarch64=('74abfea8c6647929e8dab8f59f5438cb29948bc5e477626b771721ef1c07576b')
sha256sums_x86_64=('f81ecae6adf33e0c5e949acf85f94a40b0790c07b8f87d480b91518225da26b4')




package() {

	cd "${srcdir}"

	install -Dm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
	install -Dm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -Dm644 "${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -Dm644 "${_pkgname}.target"   "${pkgdir}/usr/lib/systemd/system/${_pkgname}.target"
}
