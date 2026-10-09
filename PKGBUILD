# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
_pkgname=dekit
pkgname=${_pkgname}-bin
pkgdesc="Run multiple commands in parallel"

pkgver=0.10.1
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
sha256sums=('0cd6657d3191d1f0bd217f5124baaf165251287af2dd2634f8020a217936eab7'
            'c0a2a5b8ab8e2faa72f2838bcda75b8ee228fe5429d408b8e32d8a4db7847c3f')
sha256sums_x86_64=('59563c26122073b0430488ec16ab38f44c838b5cf6924f34fc5971f68e2cc810')
sha256sums_aarch64=('6bbc4de2f475ece6a0211578f8754fe611d70149fca24e59f3bc694a78db37fc')


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
