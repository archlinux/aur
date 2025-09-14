# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Gu1llaum-3
_pkgname=sshm
pkgname=${_pkgname}-bin
pkgver=1.6.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A modern, interactive SSH Manager for your terminal"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.tar.gz")
sha256sums=('7fbff3585259c05587ea073e09a627d67d2fea3d759e7c715a49e80e5039907f'
            '4af2770ad7ebace2b7a25d289f334c0418722a6a869df0790b96821c37815c0f')
sha256sums_x86_64=('2ce853cee798282513e11045c2691a8f916ea78a225e8c47282f77f9c3da6557')
sha256sums_aarch64=('b07f78b7b3545510455c9b0bc1e6d65a6a63ca1f5d1620cdd136bc9b7236f25e')

case "${CARCH}" in
	${arch[0]})
		_CARCH="${_barch[0]}" ;;
	${arch[1]})
		_CARCH="${_barch[1]}" ;;
	*)
		printf 'Architecture %s is not supported\n' "$CARCH" >&2
		exit 1 ;;
esac

package() {
	cd "${srcdir}/" || exit

	echo "Packaging for: ${CARCH} -> ${_CARCH}"

	install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
