# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paradise-runner
_gitname=toast
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightweight TUI IDE for making quick in-the-moment edits"

pkgver=0.1.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
sha256sums=('ab2466189803a582aef6aa754b0db0b1e6c6c24737e2bc5941c3996417787732'
            '02f178c43c5b3f44530cb543f4cd8d0c68eb8bf3ff866ed27257df8528410dde')
sha256sums_x86_64=('f7b47eed93bba761303b73ac57ee0ee5871688317ca1e6eb82c4acec56fd0e88')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
