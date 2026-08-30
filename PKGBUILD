# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=honerop
_gitname=tmr-cli
_gitexecname=timer-cli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A small command-line timer/stopwatch tool written in Rust"

pkgver=1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitexecname}")
sha256sums=('2664242d93502aa7a5e65006ad50246f67c8487c6939f141f001aacf9a83d138')
sha256sums_x86_64=('359fb0ae051e73fe601a6808afe290856743bebd38d15106c7833eb495287121')


prepare() {
	cd "${srcdir}/" || exit

	sed -e "s|${_gitexecname}|${_appname}|g" -i "README-${pkgver}.md"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
