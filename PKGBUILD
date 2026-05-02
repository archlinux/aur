# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dungngminh
_pkgname=simutil
pkgname=${_pkgname}-bin
pkgdesc="Cross platform utility TUI app for launching iOS simulators / Android emulators, discover physical devices, ADB tools and more..."

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
sha256sums=('0d068454ffcc5e4534cdab4421c7ba829c3ba276bab0a7c099a5d835aa08e31c'
            '6089969c8808bfa2c3f41aee2385e56786454c40eb6088ab803210832d045c84')
sha256sums_x86_64=('4b2ac3b1921da576765867eb3f3756f9e0475dbdb1e0f6fb12593e72f7102d90')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
