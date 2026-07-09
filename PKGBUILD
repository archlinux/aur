# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=convco
_gitname=convco
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Conventional commits, changelog, versioning, validation"

pkgver=0.7.0
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
sha256sums_x86_64=('e43b32d54f73f465f3f03b767fb1c355fc686ff0b34ec640fc82f55653bf7ab8')
sha256sums_aarch64=('d512976257e725a46ae26f6a6b6cc12a05eae8d08e2299377b1d525982a60a90')


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
