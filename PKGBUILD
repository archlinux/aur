# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=julesklord
_gitname=mangofetch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tool for fetch everythin' in internet"

pkgver=0.7.6
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
source_x86_64=("${_appname}-cli-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[0]}")
source_aarch64=("${_appname}-cli-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[1]}")
sha256sums=('3a29057f7075ed8b3bcefb58771c552366014a07dc754a8ca38b7725eb5bf4d1'
            '230184f60bae2feaf244f10a8bac053c8ff33a183bcc365b4d8b876d2b7f4809')
sha256sums_x86_64=('ed3c7c16cc37b1f2160e94b854f574c5e145cfb8ee14d74a1be5ca366378ccaf')
sha256sums_aarch64=('c8befe990de5bd017352f2914c8112bfaf67e44c451ff73a64958868c77389ab')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

