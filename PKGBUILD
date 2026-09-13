# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=webxsid
_gitname=crona
_appname=${_gitname}
_execname=(${_appname}{,-tui,-daemon})
pkgname=${_appname}-bin
pkgdesc="Local-first work tracking for people who live in the terminal"

pkgver=1.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname[@]}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-bundle-${pkgver}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-bundle-${pkgver}-${_barch[1]}.zip")
sha256sums_x86_64=('2a85a9055c216017663a1c996344c27b8e1fd84649e99c1233122745246daf5e')
sha256sums_aarch64=('831ff46587ec27940c72d17c4bdf6f56849e8cce81008c55d5f2cfadeac0bb28')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname[@]}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
