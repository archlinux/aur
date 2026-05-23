# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=FLchs
_gitname=lsdesktop
_appname=(${_gitname} 'desklaunch')
pkgname=${_appname}-bin
pkgdesc="Small utilities for working with XDG desktop entries"

pkgver=0.0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname[@]}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('5caa0f8c2fa818a896838f5b9d6bd51915a65c44bce1bef55ea71154f3366eb7'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('de446ce80dab02144d7944a9c52243004ccf67805d3ecc5c85a9639fcf6e7ffc')
sha256sums_aarch64=('3cd5b24566bb0d01840cb5e6d35c169f36e6634d7631e09edd5af94072893a5e')


package() {
	cd "${srcdir}/" || exit

	for bin in ${_appname[@]}; do
		install -Dm755 "${bin}" "${pkgdir}/usr/bin/${bin}"
	done

	for bin in ${_appname[@]}; do
		install -Dm755 "${bin}.1" "${pkgdir}/usr/share/man/man1/${bin}.1"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
