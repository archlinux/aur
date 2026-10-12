# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
_pkgname=dekit
pkgname=${_pkgname}-bin
pkgdesc="Run multiple commands in parallel"

pkgver=0.10.2
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
sha256sums=('34b43aceaa43233de4431786f26c7a8f592df2bf2f199ee4dd39c3943a724a9a'
            'c0a2a5b8ab8e2faa72f2838bcda75b8ee228fe5429d408b8e32d8a4db7847c3f')
sha256sums_x86_64=('964672af1c68f6c60a0eac3aca2b3d9847060fcc5a287747e084e84e10505a1b')
sha256sums_aarch64=('b522ab96d03829b44013a141801220f4830c0cb9ca2a93d7d08798eeb28defa9')


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
