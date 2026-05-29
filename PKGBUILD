# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
_pkgname=mprocs
pkgname=${_pkgname}-bin
pkgdesc="Run multiple commands in parallel"

pkgver=0.9.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[0]}-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[1]}-musl.tar.gz")
sha256sums=('807bc26fb13f1c8ed3372d36a9869aa5c79ad1b83bc49644f35230a79cd1bca5'
            '86cb3c8426deca7293136613f15f716f38878fca39f50db65ad3bb8409948cf1'
            'c343db79b3fcfe53edf567483cd2f47c63c104ccc6fa6c3dfbab1c8bc2c251ca')
sha256sums_x86_64=('01dfea64d8788322576a8e5c46ab4b947c819b81f58c69ac613c34e4539c40ae')
sha256sums_aarch64=('77f47c8e391adbfa909120f1dcaa152801d4d2cc38a1edb9dc59aa3f7d5e7ea4')


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

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
