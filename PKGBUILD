# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=BurntSushi
_gitname=bttf
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command line tool for datetime arithmetic, parsing, formatting and more"

pkgver=0.1.4
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Unlicense')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('4bf2e657f7b04ddcd73861c825f8622f8fd8994e860d756e8fa7e02f01acebcd')
sha256sums_aarch64=('0a052cb1744d6571fe839f36ea12230da03cf6f9054a307337c20d1aac5a7c23')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "doc/GUIDE.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "doc/COMPARISON.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "UNLICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
