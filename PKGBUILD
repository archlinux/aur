# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paradise-runner
_gitname=toast
_appname=${_gitname}
_appexec=${_appname}-editor
pkgname=${_appname}-bin
pkgdesc="A lightweight TUI IDE for making quick in-the-moment edits"

pkgver=0.8.2
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
sha256sums=('20e03ddb4be0821f4b9838d89d10e0816f3a74b3f441ed7d19363edb5a1fc201'
            'c312dfda371b87cabec0be402351f8c61f12414aaa3d2e9fe93a32d61e86ba9a')
sha256sums_x86_64=('156a829490c52d62e86eec762e3ac8ec267e8c765df4d15629a18641f661af02')


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
