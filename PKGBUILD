# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=roniel-rhack
_gitname=envi
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for managing .env files"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'libgcc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('476616572236c91d0b1cb98d0c67ffb27551726fd0b3c9572646a3c2c7fcf431'
            '4cc4952411061f483ca78f900d675d4d12c49f767010bbf90dd1cbd437ab150b')
sha256sums_x86_64=('e32376fc888f51b7b88a946178ca90e5b6e95a8f2d7eba32d9bc6692e51cd01a')
sha256sums_aarch64=('76dec04730c7f9ab879da35887b2d4cefe419392ed392425ed2b5f3450a37ddf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
