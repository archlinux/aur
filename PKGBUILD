# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=thanhphuchuynh
_gitname=lazycomd
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="One daemon for every long-running command"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('a3db07812cd12533c21b0def969e6c91efadc9ed5d0113a7e082a93e51349677')
sha256sums_x86_64=('2c64e60c7bda2a90c6aae39fe3e46b5c7c2e035b2bd172f89e577374a4ec6abe')
sha256sums_aarch64=('4f1c726f14698b08837e9d2fb1468876ffbb68af65db8fc5217a79ec4098a387')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
