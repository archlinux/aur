# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=da-luce
_pkgname=astroterm
pkgname=${_pkgname}-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="A planetarium for your terminal"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')
depends=('glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}")
sha256sums=('dcf125d76a777af20283b8cc797ded8d3eeb7d57a1ad1f642493a13764c60a29'
            'fc9a15d68ecf9e85ac60c3a01fbdb802b38efcf04c3a27050334327679c1a208')
sha256sums_x86_64=('ce68e7ef5092c7dca86dfe3e0e1bb070f9ba08f0091a2923228e2beef7ef88e1')


prepare() {
	cd "${srcdir}/" || exit

	chmod +x "./${_pkgname}-${pkgver}"
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
