# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tsirysndr
_gitname=piratebay
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Search and download torrents from The Pirate Bay"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums=('44126afafd49f7318c6f90a5baa905cf5122d5fa1cf1f8e0ae3699942529b365'
            '30ecb4ff4afd5dd70a51d7727c4f873db145b899fb9836627eacca05080515bf')
sha256sums_x86_64=('81a0dda1c001317ac1dc31376fff6b3e8b661825e278cbfa6cbaac70e92ba9bb')
sha256sums_aarch64=('d3a7a4b7fefc19181b94c6a2a03515944203413f499d5ad3d44fa9f2a9987378')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
