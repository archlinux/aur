# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
_pkgname=dekit
pkgname=${_pkgname}-bin
pkgdesc="Run multiple commands in parallel"

pkgver=0.10.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

replaces=("mprocs-bin")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('help2man')

source=("CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('dab0873d5e77937947d0235f207821a8934fa531f8a3c66bd24ab3f4d16c46ac'
            '48b9dc33bbf0603627fc33542252dba87c4bc2442e3fdf820eb9b83c26c17551')
sha256sums_x86_64=('330753d26feb9f96b79a388e730f8bd4414564520257f37bfc997c626b450f44')
sha256sums_aarch64=('35b2ae81a23a1b67c3f2fb95f993b26257af23270f651cc44cc1f64eba23d5fe')


build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
