# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clashmi-bin
_pkgname=${pkgname%-bin}
pkgver="1.0.33.1905"
pkgrel=1
pkgdesc="Clash.Meta GUI for Android, iOS, macOS and Windows"
arch=('x86_64')
url='https://github.com/KaringX/clashmi'
license=('MIT')
depends=('gcc-libs' 'gtk3' 'libayatana-appindicator' 'libkeybinder3' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("clashmi-1.0.33.1905_linux_amd64.deb::https://github.com/KaringX/clashmi/releases/download/v1.0.33.1905/clashmi_1.0.33.1905_linux_amd64.deb")
sha512sums=('c3fb4cf795e5076fc563eaacf97eaf23b1109d750689dd85e545eb8747bcd5d217f32f7ea20d320b57699c88c49f232effa6c00b4b03b1c87ba5972667559fdf')

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
