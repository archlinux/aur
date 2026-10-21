# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=drunkleen
_pkgname=leenfetch
pkgname=${_pkgname}-bin
pkgver=1.4.3
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
            '4201e7cecd53cf37a39b94e0b6bf921e7a772895f7b0cb0f1c654e98d3fe4dd6'
            '472738a2d79be0435296870aceda076c2bc7c653c1e956a1333b1ccf6e08e6e3')
sha256sums_x86_64=('db41ce451ba14c9e1be4937366399c9112a5514e7f87939a902c9241de0d64aa')
sha256sums_aarch64=('0bb16acc69a40920b72526c70e500a9f13963847652e67eafd5e3015e0a97632')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
