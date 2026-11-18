# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=clainstone
_gitname=cbirds
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A flock of birds in your terminal"

pkgver=1.8.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${pkgrel}_${_barch[1]}.deb")
sha256sums=('a9751dc8bb1ef473aeb864915d47b34076e4c8911ba77a9c26e68087239ff76c'
            'ce43414abce90c24554e5a903c3a2cfa8112deb380b7842daa91b481ef33e444')
sha256sums_x86_64=('87206198054133528736a5f99c564375cdbd4df685c676b7bbb3ea298b1e7f5f')
sha256sums_aarch64=('313ef40dba8db08111966e43b34a2c3ee5a98578a68e7f87205891823827a614')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
