# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=zsuroy
_gitname=dockerview-go
_appname=${_gitname%-go}
pkgname=${_appname}-bin
pkgdesc="A simple terminal-based Docker performance monitor that displays real-time container statistics in a beautiful table format"

pkgver=0.1.24
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('70db10b6643d9be32e9d46d2fcb2383db00c5de8810f8354af38d638cd7e09c5'
            'cf24e4cc5e482fe153f66c4b6582cbca7142668b001009973d6d77eac23e68ad')
sha256sums_x86_64=('85fb86e023fc6f13f7fa03ebc06eae5e681b0f73e0ad0362462472d7fb1920be')
sha256sums_aarch64=('f1db74ae6ca873f4f59d9a8c380064997de3f1ef422bbe85c052612e827d5edb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
