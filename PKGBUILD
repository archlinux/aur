# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mainak55512
_pkgname=rjq
pkgname=${_pkgname}-bin
pkgver=0.1.13
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="Simple and fast JSON filtering tool"

arch=('x86_64')
_barch=('linux_x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgver}/${_pkgname}_${_barch[0]}.tar.gz")
sha256sums=('e2d597a3b9d9e25352ddb6fe813ae792d89dbbf561cc44e63750266d5439f826'
            'df8c89a83deed26204b4bc4878d2e4b8c1df29c6de1bc89211c62a56b2d4fb86')
sha256sums_x86_64=('6d90286ce2de007342d66efc3d59c48dd28b6425e53a5a5548b72a5f54d21b7f')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "target/${CARCH}-unknown-linux-musl/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
