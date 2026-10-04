# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aymericbeaumet
_gitname=aggr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Git-native feed reader"

pkgver=1.11.0
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
sha256sums=('f4f6d0e45fc5517d414ca5be08ea68500bead924f2fd27d9285f7293791fe26e')
sha256sums_x86_64=('332e730ccbe19a76c25f76fa9ca7a33314acd96e0c418ee603b42efed783f369')
sha256sums_aarch64=('07e79f70de8b8060cefb3fb4278d81e329a16f0562be655dc99af1b1a302f6e5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
