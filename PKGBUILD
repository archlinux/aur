# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=brevity1swos
_pkgname=rgx
_projname=${_pkgname}-cli
pkgname=${_projname}-bin
pkgdesc="A terminal regex tester with real-time matching and multi-engine support"

pkgver=0.12.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT' 'Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_projname}")
depends=('glibc' 'libgcc' 'pcre2')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_projname}-${_barch[0]}.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_projname}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('b84bb1f09def9ec5490d1fce00d471d8d93690a976e5baba06f891d40c86c869')
sha256sums_aarch64=('3bab171db03ef080a8e4571762137f6a2af78cdebb231e50b9e22b335aae4fd5')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

package() {
	cd "${srcdir}/${_projname}-${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
