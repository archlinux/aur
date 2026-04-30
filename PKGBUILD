# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=PerryTS
_pkgname=perry
pkgname=${_pkgname}-bin
pkgdesc="Compiles TypeScript directly to executables using SWC and Cranelift"

pkgver=0.5.386
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
sha256sums=('a66da33bf272f9ad5ec4de430eeeb34d1e149a2f8396e3fd1bb4081db21af955'
            'c871483477d7105432645affac5be5edbd92b41a6faedb4c692e0681e46ada09')
sha256sums_x86_64=('b5368bfe8f69308632c520e614cf10f61d446b52c6183eb0b3d8f517f4e58473')
sha256sums_aarch64=('a8548cdc18aa3106359f78131349a212b843d63b38786489b018a9a96e35709e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	for lib in "lib${_pkgname}"*; do
		install -Dm644 "${lib}" "${pkgdir}/usr/lib/$(basename ${lib})"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
