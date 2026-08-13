# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thornoar
_pkgname=pshash
pkgname=${_pkgname}-bin
pkgver=0.1.20.1
pkgrel=1
pkgdesc="A functional pseudo-hash password generator"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
_urlbin="https://github.com/${_pkgauthor}/${_pkgname}-bin"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${_urlbin}/raw/refs/heads/master/${_pkgname}-static.${pkgver}.${arch[0]}-linux")
sha256sums=('92e498dfdf4478c5d306c11af29b375797420464964efda7329d27a8025af6bb'
            'b95e68d91dc057e4eaed17d8a766c4a3619e25c6e9dfce6b5cfdd1946040fc13')
sha256sums_x86_64=('74a029400ad2e7cc9e15149ca7fb545f09738a1f0e37f6082f5d011e2a64ecc3')

options=(!strip)

prepare() {
	cd "${srcdir}/" || exit

	chmod +x "${_pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}-${pkgver}" --output "MAN-${pkgver}.1" --no-info
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
