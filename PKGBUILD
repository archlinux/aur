# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=rpnx
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="Terminal RPN / XRPN scientific calculator written in Rust"

pkgver=0.1.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlicense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('9b24bee5a1a8b2b667aec78c1c7851b997e2dc1cc4cd10dfc82c672a79a3018e')
sha256sums_x86_64=('e4926bda982bcec099d8ca70c20d28c241f4012c93781fc5dad3a5b7aa6fcd39')
sha256sums_aarch64=('3b3a7a33b75940841af53835cc3a1fb33e19709d73ef9bba22dae3318668050a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
