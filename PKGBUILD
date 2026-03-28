# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=PerryTS
_pkgname=perry
pkgname=${_pkgname}-bin
pkgdesc="Compiles TypeScript directly to executables using SWC and Cranelift"

pkgver=0.4.24
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'xz')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('73931a493e79dcba85d16afbed7665f6c2642ce8c103d6bd8d333de3e44111e7'
            'c871483477d7105432645affac5be5edbd92b41a6faedb4c692e0681e46ada09')
sha256sums_x86_64=('66d735ca0ba3e1c79a7378480be55aab0ce7707a56c4ba40b620c80c70ca64f0')
sha256sums_aarch64=('6b889a3303d2359b37862b8fe284f64b81f90fa56423ab7073f8405ad787fd68')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for lib in "lib${_pkgname}"*; do
		install -Dm644 "${lib}" "${pkgdir}/usr/lib/$(basename ${lib})"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
