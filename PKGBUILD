# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=juanibiapina
_gitname=deltoids
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tools for reviewing code in the agentic era"

pkgver=0.20.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'openssl' 'zlib')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[1]}.tar.gz")
sha256sums_x86_64=('544cdfe8fb75071748da0ab92aa0bd9bf278243dcf2e0b01a72ff6940cb8f148')
sha256sums_aarch64=('219065a627de3e001b5a63d72ffaec3bbf9eaeebc3a945d903c666513db3d226')

case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-cli-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
