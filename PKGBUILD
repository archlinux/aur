# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sorairolake
_pkgname=randgen
pkgname=${_pkgname}-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Generate pseudo-random bytes"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.zst")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.zst")
sha256sums_x86_64=('8e829cd5dcfddd288d61bd50fbf18e535ba8837e29e6fb6235be09f26e39a41d')
sha256sums_aarch64=('05f64e126aa31a464b2ac9fdf4fc364bc33848723ff10b67bfd5d16f9a435e37')


package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for license in "./LICENSES/"* ; do
		install -Dm644 "${license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-$(basename ${license//\.txt/})"
	done

	for manpage in "./man/"*.1 ; do
		install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man1/$(basename ${manpage})"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
