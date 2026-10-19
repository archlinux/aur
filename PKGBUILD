# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=clainstone
_gitname=cbirds
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A flock of birds in your terminal"

pkgver=1.7.0
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
sha256sums=('9e506cf361ef9b8a65a8ad15aecffe306535dbb9646efe6758c95e3cf1334865'
            'ce43414abce90c24554e5a903c3a2cfa8112deb380b7842daa91b481ef33e444')
sha256sums_x86_64=('ed83085bd148c9d0dd5ad98b32d86fb1c39b6a997b10d5dcc0877a5765bdf950')
sha256sums_aarch64=('e130f264b59ceb3a4bc57674a5c4f46df5b052e60916acef320543c5ebce7802')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
