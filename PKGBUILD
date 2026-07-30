# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=autobrr
_gitname=netronome
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern network speed testing and monitoring tool"

pkgver=0.13.0
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
sha256sums_x86_64=('6bb887d04b180442ad46b76f018c6353958d9d5e28145d986dd6ac5520b3550a')
sha256sums_aarch64=('4546069733fd5e9caf1ca5c3f275dcbc699c23f1cab5d10dd8de2011d63fc7a6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.service" -t "${pkgdir}/usr/lib/systemd/user/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
