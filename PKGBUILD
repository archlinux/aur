# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jackMort
_gitname=brothy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A calm terminal Markdown reader: folder tree, outline, live reload, Obsidian-flavored, 26 themes"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('96f8591f18807b577cb65a81c8e70bbc9b47014029f0f3428b7cdaf390496bbd'
            '483336fdde3746910f4fed5c399c64c765c2cdf19f886ad952c8af6c6a663b35')
sha256sums_x86_64=('41c9bf6530eecaf8adb2207d39d656e3e73a04d5232d8c8ecece86f175076678')
sha256sums_aarch64=('67683874e825590b85475cec056c5421755666954eecb25933f6b987e79ab8f3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
