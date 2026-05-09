# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: tee < teeaur at duck dot com >

_gitauthor=antonmedv
_gitname=walk
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal file manager"

pkgver=1.13.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('8b24512cec1691926cc3517a4302e1eff29c6e8f947789d71a6a481b566a508f'
            'd63a8c4f17dde022f8d1f96a4b2c744821f65bcae926b4de4ee77230a70cdee4')
sha256sums_x86_64=('7c3b6e28fd0eee20170a07be5ceae001e466d8948b32feb005c447f4cf7c3c21')
sha256sums_aarch64=('42664c11d54d1e7f7ca5131c34197de120f03d535238d6cadbe03bba8303ebc8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
