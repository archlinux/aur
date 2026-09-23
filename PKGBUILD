# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=autobrr
_gitname=netronome
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern network speed testing and monitoring tool"

pkgver=0.14.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("${_appname}.service")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('5656181fd7951c3a7b20fa32777c7564101e5824fd2471521748ed52cb261cb5')
sha256sums_x86_64=('68e65470c7e68fe42394069b2d771fae6d5c2dc000fe5d70ca16ce39edc1c318')
sha256sums_aarch64=('66fd50f4d1c23c5457ff9d6eeea4c4a1e2da96835f8ef129687221b376877c4d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.service" -t "${pkgdir}/usr/lib/systemd/user/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
