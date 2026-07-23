# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paradise-runner
_gitname=toast
_appname=${_gitname}
_appexec=${_appname}-editor
pkgname=${_appname}-bin
pkgdesc="A lightweight TUI IDE for making quick in-the-moment edits"

pkgver=0.2.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appexec}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
sha256sums=('f6afa6f75dec9d0242347885746e42c84688fcc08f96f57a561f4bb8d7af6ca9'
            '02f178c43c5b3f44530cb543f4cd8d0c68eb8bf3ff866ed27257df8528410dde')
sha256sums_x86_64=('02b5c01503f8e49918b5aa883caed793d65d5a3ea741ee6a34ee0617465d1a8f')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appexec}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
