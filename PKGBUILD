# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paradise-runner
_gitname=toast
_appname=${_gitname}
_appexec=${_appname}-editor
pkgname=${_appname}-bin
pkgdesc="A lightweight TUI IDE for making quick in-the-moment edits"

pkgver=0.12.0
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
sha256sums=('b8e01074faf1c8e2bfb9b85f19f4ca10b177528141f6373e299b33f69a4bf216'
            'c312dfda371b87cabec0be402351f8c61f12414aaa3d2e9fe93a32d61e86ba9a')
sha256sums_x86_64=('fc6722180d2d20f8b8a4b4dc0cd3df94ab25b2e12c892a7c8c3f4d8bfbe62dfe')


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
