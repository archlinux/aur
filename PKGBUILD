# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=julesklord
_gitname=mangofetch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tool for fetch everythin' in internet"

pkgver=0.7.8
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
sha256sums=('c38ca98121549abd19d6f5c9eeae401ca22bcf22637e9cefa206f072c9f4bea5'
            '230184f60bae2feaf244f10a8bac053c8ff33a183bcc365b4d8b876d2b7f4809')
sha256sums_x86_64=('9619ef27d4d632b3f691f41b17f1e5a4722df9869312af4a5d4d8c49d30593b6')
sha256sums_aarch64=('30d6534a30812e9c5c5b821f1ad4c1f0e8ce16ea0c8fd96247a863a6c4d84172')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

