# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pvolok
_pkgname=mprocs
pkgname=${_pkgname}-bin
pkgver=0.7.1
pkgrel=5
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch[0]}-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch[1]}-musl.tar.gz")
sha256sums=('c343db79b3fcfe53edf567483cd2f47c63c104ccc6fa6c3dfbab1c8bc2c251ca'
            '6f25540bbd0032976850c47a6bb78eb437143946439d049e53a3c343525fddbb'
            '38209d2163c27437214315e84c503799d7a7441bce4d835c4aa07533ea092ed6')
sha256sums_x86_64=('c4441fc2528ec406f2139481436abe87b515033566db3f374c498cccdb16c583')
sha256sums_aarch64=('8fc7a23caebe03a68cee54aea428b4f7d45a6305ba9377b0800db277128f2473')


build() {
	help2man ${_pkgname} --no-info --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "CHANGELOG-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
