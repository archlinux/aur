# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=drunkleen
_pkgname=leenfetch
pkgname=${_pkgname}-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Fast, minimal, customizable system info tool in Rust (Neofetch alternative)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libx11' 'libxrandr' 'glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "MAN-${pkgver}.1::${_urlraw}/leenfetch.1")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('e673ac9666ad19db4dceaac6e42e8b0c3e9e86b1911e6877bb6ee7f3f31565ee'
            'd93b801edf77b9cfe1120c46ead0f4603ab459a266456b63c084684af3957d76'
            '6b9c390d5def3862cd0d88c89ce21b2fcf4a8b56a63816acace4492e2f32408e')
sha256sums_x86_64=('20b7dbdd7d81636101857f408acfd2f6bc64f0cee2e722639094152ce44003bf')
sha256sums_aarch64=('c227458cbb4c05c9f6c03a7b8cefcf6e22212822e8392f90437960d3bddd37a9')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
