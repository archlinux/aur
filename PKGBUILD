# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
_pkgname=mprocs
pkgname=${_pkgname}-bin
pkgdesc="Run multiple commands in parallel"

pkgver=0.9.1
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
sha256sums=('f4a268c1ef48c5837aa3edeece461d78f86af8e3adb5038a4535335d848b8a48'
            '8d3d3141f0fc0f86a93b9c7faa71c5be63f7b41323bcabb5713d0980cbb9613b'
            'c343db79b3fcfe53edf567483cd2f47c63c104ccc6fa6c3dfbab1c8bc2c251ca')
sha256sums_x86_64=('25677db6eb69a7d310367e354620d3114f45df4cb33d1a36195658781613f490')
sha256sums_aarch64=('470d400fa3636653f33f39541c8357922e88bea88ae788b35be78e961e614522')


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
