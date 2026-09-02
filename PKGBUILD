# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clashmi-bin
_pkgname=${pkgname%-bin}
pkgver="1.0.29.1503"
pkgrel=1
pkgdesc="Clash.Meta GUI for Android, iOS, macOS and Windows"
arch=('x86_64')
url='https://github.com/KaringX/clashmi'
license=('MIT')
depends=('gcc-libs' 'gtk3' 'libayatana-appindicator' 'libkeybinder3' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("clashmi-1.0.29.1503_linux_amd64.deb::https://github.com/KaringX/clashmi/releases/download/v1.0.29.1503/clashmi_1.0.29.1503_linux_amd64.deb")
sha512sums=('fe59ee5905a8e04eef1f206a4a97cf620ae77a0af8584e20b40664bcfc560c439cb478c8e96241a8938ceea4c4d5180926acc625095d0a70294eac01bb8b1277')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/clashmi-${pkgver}_linux_amd64.deb"

	_data_archive=$(printf '%s\n' data.tar.*)
	bsdtar -xf "${_data_archive}" -C "${_datadir}"

	install -d "${pkgdir}/usr/bin"
	cp -a "${_datadir}/." "${pkgdir}/"
	ln -s "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
