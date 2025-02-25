# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=laktak
_pkgname=chkbit
pkgname=${_pkgname}-bin
pkgver=6.2.0
pkgrel=1
pkgdesc="Check your files for data corruption "
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'arm64' 'riscv64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
makedepends=('help2man')
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_arm64=("${_pkgname}_${pkgver}_arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_riscv64=("${_pkgname}_${pkgver}_riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-riscv64.tar.gz")
sha256sums=('2164c7b23ede004282e53a7cda37ce11de5d74dbd807199a411b34420645bd91'
            '236d7b6e721392a8daa99c49fd3da4e07b707d63344889aa4ed8dc2558b4b603')
sha256sums_x86_64=('7faf7edb8e37528411d19ad890c7741b7f6740b08032dc70c2ef99fe1e486ac5')
sha256sums_arm64=('f4dd1b812f6e74952ee7477352fbf27e6327b209227b4e2b1e744f91bb436ea1')
sha256sums_riscv64=('f3fc2d4183b2b0be1538d7fc0706f945659449d92390555a40404ae3408feb4a')

build() {
	cd "${srcdir}/" || exit

	help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
