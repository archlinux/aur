# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=julesklord
_gitname=mangofetch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tool for fetch everythin' in internet"

pkgver=0.7.9
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'xz')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('c38ca98121549abd19d6f5c9eeae401ca22bcf22637e9cefa206f072c9f4bea5'
            '230184f60bae2feaf244f10a8bac053c8ff33a183bcc365b4d8b876d2b7f4809')
sha256sums_x86_64=('3034a99262450e3a9843374b877693d0ad4e928b0907595c991cffebd72b42ac')
sha256sums_aarch64=('cf50bb0b4f4fa9375672b846aee75a7ebd56c5c3f2c619250717c73e88b7c1c5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

