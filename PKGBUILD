# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=convco
_gitname=convco
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Conventional commits, changelog, versioning, validation"

pkgver=0.7.2
pkgrel=1
_gitversion=v${pkgver}

_lib="musl"
arch=('x86_64' 'aarch64')
_barch=("x86_64-unknown-linux-${_lib}" "aarch64-unknown-linux-${_lib}")

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('f9cfad24af372018f4b8d430cf86d1b7b9b36fcb7e1db5dd30c54b2eed7dde75')
sha256sums_aarch64=('7a4523573a81d24f37aa4d22aa26d8a3083188422213efe0274a7fbbd840c741')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
