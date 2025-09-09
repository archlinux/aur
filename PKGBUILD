# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Gu1llaum-3
_pkgname=sshm
pkgname=${_pkgname}-bin
pkgver=1.5.2
_pkgvername=${pkgver}
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
            'f4daa90b98934f27cafbf11e62c30fed3da653603aae70ba6a3f669449a07101')
sha256sums_x86_64=('579c40b1280e8dc7dc454289c4d4f4627b77adec810d37fd9531deb452e281c8')
sha256sums_aarch64=('b743a42492e974dad068f2e43f1ef6a4f8ed0efad3ceac06a9002c6a56b236c2')

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
