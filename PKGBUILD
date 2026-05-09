# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=antonmedv
_gitname=howto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal helper for querying LLM"

pkgver=0.0.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('6571d8e16196f5f348e9f9f4e6ff0a7f0b6e1e09ffd0fd1519abf976bc52b4c5'
            'fba9352499e9740890722bd09a06a0ddd78f87d309764b0344eaf68f9b9d5858')
sha256sums_x86_64=('5f378f7814a4de13a744200a28729acb5c8e7034302abf5e71f79a4ce154c604')
sha256sums_aarch64=('033880abd2dc16a3e4990949792c92701e916fc80aa03c4698b5cc38fc7856af')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
