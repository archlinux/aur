# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_bins=(promptcmd promptctl)
_pkgauthor=tgalal
_pkgname=promptcmd
pkgname=${_pkgname}-bin
pkgdesc="GenAI prompts as runnable programs"

pkgver=1.1.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_bins[@]}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.xz")
sha256sums_x86_64=('41b241e530ddef3a1be080c9ffa4e510ddb52c997f536543a09b4a98e2aa8047')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/${_pkgname}-${_CARCH}/" || exit

	for bin in ${_bins[@]}; do
		install -Dm755 "${bin}" -t "${pkgdir}/usr/bin/"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

