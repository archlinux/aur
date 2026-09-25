# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=66-m
_gitname=sorting-visualizer
_appname=sorting-algorithm-visualizer
pkgname=${_appname}
pkgdesc="See and hear Sorting Algorithms in Real Time: 22 Algorithms, 30 Visuals"

pkgver=2.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-only')

provides=("${_appname}")
depends=('bash' 'java-runtime-common')

options=('!strip')

noextract=("${_appname}-${pkgver}.jar")

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}.sh")
source_x86_64=("${_appname}-${pkgver}.jar::${_ghurl}/releases/download/${_gitversion}/${_gitname}.jar")
sha256sums=('fb09f525603930f30065433bfae5214075d97405c55235075b0b341b770d9ab3'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '42a812e7a9588065c0c72d4e12e20b70b5b48e721e413d72260d846d16477dec')
sha256sums_x86_64=('0b2f9cc6a4618455ff5e9f6c3455bd4db5364cd20a67a58fd63bccf8c153b7f5')


build() {
	cd "${srcdir}/" || exit

	cat ${_appname}.sh ${_appname}-${pkgver}.jar > ${_appname} && chmod +x ${_appname}
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
