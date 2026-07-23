# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=FLchs
_gitname=lsdesktop
_appname=(${_gitname} 'desklaunch')
pkgname=${_appname}-bin
pkgdesc="Small utilities for working with XDG desktop entries"

pkgver=0.0.2
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
sha256sums_x86_64=('5e9620e5056449d7cf26447cfa5bab267db14d08b0d5befc566f297186102a66')
sha256sums_aarch64=('295f3c7e70ae1ba8fcfeaf3f6c87d4a2e8cb0c2f3bb583b2350cea5185bab9aa')


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
