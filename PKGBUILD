# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Cyxuan0311
_gitname=PNANA

_appname=${_gitname,,}

pkgname=${_appname}-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="A modern terminal text editor built with FTXUI, inspired by Nano, Micro, and Sublime Text"

_gitversion=v${pkgver}

license=('MIT')
arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}"
url=${_ghurl}

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/${_gitversion}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/${_gitversion}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${arch[1]}.tar.gz")
sha256sums=('b058def908f9b2c1285944a4deb37e8f5546da982a08188e52d9e61ff67d2191'
            '15286e8fd582d982f4ba075e0fb971eb72d5526bebd91ba89f8f72d17ccfb7ae')
sha256sums_x86_64=('d2eec2fef4c48eddf5506b9ef35a821ac63ff9abc4b3a95a4b667be2ef023859')
sha256sums_aarch64=('e9525e0e11c3a18216c05106b0a7535c76c1a8bf16b3c9691ccb233cd6fa5866')


package() {
	cd "${srcdir}/${_appname}-${pkgver}-${CARCH}/" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 ".config/${_appname}/config.json" "${pkgdir}/usr/share/${pkgname}/default_config.json"
	install -Dm644 ".config/${_appname}/tool_paths.json" "${pkgdir}/usr/share/${pkgname}/default_tool_paths"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
