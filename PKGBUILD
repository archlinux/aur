# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=wallr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="🎨 GPU-accelerated animated wallpaper engine for Wayland"

pkgver=0.6.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('cc3c6e9b47b26034c07cf061c660c58cf11a522d8d26eed42b68d8ece1c5076e')
sha256sums_x86_64=('208dcbb958aa2c12e7cb9172d4807d2140b147aa974355225d855430d3c6cef5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -dm7555 "${pkgdir}/usr/share/doc/${pkgname}/docs/"
	cp -rf "docs/"* "${pkgdir}/usr/share/doc/${pkgname}/docs/"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
