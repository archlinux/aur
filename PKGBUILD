# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=abogoyavlensky
_gitname=skl
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A minimal CLI tool to fetch and install agent skills"

pkgver=0.1.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('mise')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('c7775ffbe4b7fe4b2cf46eede47189092d7149ed039f189e818856003e280cbf'
            '26ef0a9d298ba973d0b9bd3956e1f76e9d3c520f442e95917212e44905b1df94')
sha256sums_x86_64=('7c20239137611f09deda80c623ebdc360344c0ec9174fb3a71e23401e36b7378')
sha256sums_aarch64=('e3436e89913017d3ec1c7eabbdaf062b06f1205b1195ba8b73a1aa0194e79548')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
