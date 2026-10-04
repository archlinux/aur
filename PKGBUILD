# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aymericbeaumet
_gitname=aggr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Git-native feed reader"

pkgver=1.12.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("${_ghurlraw}/readme.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('22c0ad6369e8b6fb7ffd6e7c2e737f0c55e6e4bb148f86025bc215a30e4d1b46')
sha256sums_x86_64=('f4d1be4f2199f548475aba47182f590c5d217222d554cf831e97147ca80ddee8')
sha256sums_aarch64=('0c3b5d482f5b9c76816d9fd1bb675490a32ad3752919cb3fd9f9d447e439696b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
