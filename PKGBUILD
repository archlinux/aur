# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=PerryTS
_pkgname=perry
pkgname=${_pkgname}-bin
pkgdesc="Compiles TypeScript directly to executables using SWC and Cranelift"

pkgver=0.5.922
pkgrel=1
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
sha256sums=('bec1809954fd5cf93b34d8f952782e8b1f0d999c5ff6e196d4196c0b52457edf'
            'c871483477d7105432645affac5be5edbd92b41a6faedb4c692e0681e46ada09')
sha256sums_x86_64=('19af178dc7cfcb3a4d6f44dc8dfc9e264c7715270e5853351dcf24e0eedca33f')
sha256sums_aarch64=('d43042a3a32aec63b055e9d3d268dfea327f9dfe5d354646f28ec5ae274ea878')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for lib in "lib${_pkgname}"*; do
		install -Dm644 "${lib}" "${pkgdir}/usr/lib/$(basename ${lib})"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
