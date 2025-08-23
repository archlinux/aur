# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thornoar
_pkgname=pshash
pkgname=${_pkgname}-bin
pkgver=0.1.15.1
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
            'a34a8dd8137a7d9ac0e43218bb5726204915629e3c51be0b3cd8e7237515be46')
sha256sums_x86_64=('2ad1eba3149d8c1db096b076c1c544ab841294edc36ad7aeb93d212ee5c8fe3e')

options=(!strip)

prepare() {
	cd "${srcdir}/" || exit

	chmod +x "${_pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}-${pkgver}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
