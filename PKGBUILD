# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=zquestz
_pkgname=geoclue-tz
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="Generate geoclue /etc/geolocation based on the current time zone."

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.zip")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[2]}.zip")
sha256sums_x86_64=('a2f8dc400989eb0ed2c0b857d544d6fbe7004a5b3d446bb7d92d502e99107eaf')
sha256sums_i686=('7152ede151bc4ad106044ccaee1ede9436962b6e89d5383dea6ee7cb3aeed8fa')
sha256sums_aarch64=('7679d1e86c43c73551ccd3135054e73be5ba88786173073c9cfd0b374ee6124c')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_CARCH}" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
