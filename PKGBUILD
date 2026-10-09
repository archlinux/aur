# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=viewer
_appname=${_gitname}
pkgname=${_appname}-rs-bin
pkgdesc="Universal TUI file viewer written in Rust"

pkgver=0.1.5
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
sha256sums=('f5c24c97e5e1c5bca8ffdbb9c166c5597d168b8a3b2869c893f86eaf3928fa1e')
sha256sums_x86_64=('c9a9a71183adc1f169f906450d85e227cf99de8eb5a6d1c8947c240287773464')
sha256sums_aarch64=('29f116922d7bf5832c52e39c985e82a094d14c72a60a1f0047be1bb6f8563496')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
