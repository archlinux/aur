# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=convco
_gitname=convco
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Conventional commits, changelog, versioning, validation"

pkgver=0.7.1
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
sha256sums_x86_64=('301c52cf3825cf9bdc66832bc2936c31816e5b468d02f125469ca3b489cbce72')
sha256sums_aarch64=('9921caf7c9bdb7472b1aa438042672db7be1a78f2a03aad1164db89d44382469')


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
