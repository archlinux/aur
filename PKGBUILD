# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=drunkleen
_pkgname=leenfetch
pkgname=${_pkgname}-bin
pkgver=1.4.1
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
            '936be906ecf45acaa0daa8833e2dcd50f47bd5de15e142d4d1c1861dc05de245')
sha256sums_x86_64=('9ef9f13de21d7f0d75df0317420ea59fa687088f569acecfd10975b35bd524b6')
sha256sums_aarch64=('37cf190bbaf0af6cd5134d7a030562274cd25a7cb0fe216162a738d5b7d28f42')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
