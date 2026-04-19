# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clashmi-bin
_pkgname=${pkgname%-bin}
pkgver="1.0.20.607"
pkgrel=2
pkgdesc="Clash.Meta GUI for Android, iOS, macOS and Windows"
arch=('x86_64')
url='https://github.com/KaringX/clashmi'
license=('MIT')
depends=('gcc-libs' 'gtk3' 'libayatana-appindicator' 'libkeybinder3' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("clashmi-${pkgver}_linux_amd64.deb::https://github.com/KaringX/clashmi/releases/download/v${pkgver}/clashmi_${pkgver}_linux_amd64.deb")
sha512sums=('81f7bf32a889013b65a6e8ec34def13cb8ad65a284ac5a15ecc79b68d2f822a26b6670bfb4cb6ddebce772cc812d93b45812542579dcabc88f8628015878c272')

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
