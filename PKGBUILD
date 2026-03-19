# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thornoar
_pkgname=pshash
pkgname=${_pkgname}-bin
pkgver=0.1.20.0
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
            'fa7621e72d610fb4a6d4b9dc33fa522c21cdf2f8351c5796b934860d3166cd25')
sha256sums_x86_64=('e280fa6b225b1bc0114420b839182a18a4ccc882094dec0c1278ee8df231cc23')

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
