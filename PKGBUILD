# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clashmi-bin
_pkgname=${pkgname%-bin}
pkgver="1.0.24.1006"
pkgrel=1
pkgdesc="Clash.Meta GUI for Android, iOS, macOS and Windows"
arch=('x86_64')
url='https://github.com/KaringX/clashmi'
license=('MIT')
depends=('gcc-libs' 'gtk3' 'libayatana-appindicator' 'libkeybinder3' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("clashmi-1.0.24.1006_linux_amd64.deb::https://github.com/KaringX/clashmi/releases/download/v1.0.24.1006/clashmi_1.0.24.1006_linux_amd64.deb")
sha512sums=('5c40cb6dace2dc2dcd0a3c35c5a3d111cce252152f4840259c5d6b150180c3fb260d40d7b517e553119fc126b2683652c156b86d24bca27903dcfe6204472215')

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
