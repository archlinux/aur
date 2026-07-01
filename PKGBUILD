# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clashmi-bin
_pkgname=${pkgname%-bin}
pkgver="1.0.26.1201"
pkgrel=1
pkgdesc="Clash.Meta GUI for Android, iOS, macOS and Windows"
arch=('x86_64')
url='https://github.com/KaringX/clashmi'
license=('MIT')
depends=('gcc-libs' 'gtk3' 'libayatana-appindicator' 'libkeybinder3' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("clashmi-1.0.26.1201_linux_amd64.deb::https://github.com/KaringX/clashmi/releases/download/v1.0.26.1201/clashmi_1.0.26.1201_linux_amd64.deb")
sha512sums=('c6ac6f51d9702845c2d939865786926b54006676da8231c6e48ff6de9c89347dcd93aa5b6820ba1c5bb2cfb68d1490a5d52b8789f7bfc0e44a7810980d08c846')

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
