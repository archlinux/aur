# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=laktak
_pkgname=pipevcr
pkgname=${_pkgname}-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Record and play back Linux pipes at different speeds"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
makedepends=('help2man')
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux_amd64.tar.gz")
sha256sums=('b04ffed3126b1640db6a77dbf8990785723ffc59d07b808e663830f04768bbf5'
            '6b9bcd6760aa7683ade74e7802a085965ac09dc647c73712d5208458f3acb409')
sha256sums_x86_64=('896a7ccd8aafdd7aa9c8740e45c873479d5d19a8f300b0b53d599c1ba2aeac06')

build() {
	cd "${srcdir}/" || exit

	help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info --no-discard-stderr

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
