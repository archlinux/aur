# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=noahbclarkson
_gitname=codebase_viewer
_appname=${_gitname//_/-}
pkgname=${_appname}-bin
pkgdesc="Scan, explore, and document/export large codebases"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x64-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=(!strip)

source=("APPLICATION.desktop" "METAINFO.xml" "ICON.png")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('6f834952398511ef2fe1fbca1521181752bdd4cc28355205e253f7fe145e52b0'
            '990fa050f1dd3851a5f3e4f2211903434348418d9844c280266b36dc5d1c97c4'
            '6357fd8b31e14b1b2deeac1e4396c97b9979b97d5c31781001a54da22e59ea78')
sha256sums_x86_64=('59360ff7eb522004105dfbea2d0737c71f0d815dfcbbb11fba5fae0430b8dad2')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm644 "ICON.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png"

	install -Dm644 "APPLICATION.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "METAINFO.xml" "${pkgdir}/usr/share/metainfo/com.${_appname}.app.metainfo.xml"

	install -Dm755 "${_gitname}-${_gitversion}-${_CARCH}/${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_gitname}-${_gitversion}-${_CARCH}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${_gitname}-${_gitversion}-${_CARCH}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "${_gitname}-${_gitversion}-${_CARCH}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
