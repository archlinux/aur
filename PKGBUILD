# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pythops
_pkgname=oryx
pkgname=${_pkgname}-bin
pkgver=0.4
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

depends=('gcc-libs')
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/Readme.md"
        "RELEASE-${pkgver}::${_urlraw}/Release.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl")
source_aarch64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl")
sha512sums=('d361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
            '82c0c8efb7a4c5b0ac7863ca953f8e8d5ff979a4d864361c1684efc63cff91365c19ebb2734fb31e462407a3adf097fb1fc711ea2cfbeb5b730b5ea949a4cb71'
            '899b0e1295c78144fe41b22e83ddb4b7b03a90e0860ddbf0d6f589826c50b1b3c9cc4080fef57009c1fbb828abbc9926a915c5947214903a9d55ed9426d4f074')
sha512sums_x86_64=('5f4db913f6ce7e4e27e1782b4d5f0103fe85cd167040756cead4888233e8a4d1ca01886ce2d7fc24f08ad421f8a52e36c4281aaebaa261a1cfb46562bb961821')
sha512sums_aarch64=('5f4db913f6ce7e4e27e1782b4d5f0103fe85cd167040756cead4888233e8a4d1ca01886ce2d7fc24f08ad421f8a52e36c4281aaebaa261a1cfb46562bb961821')


prepare() {
  chmod +x ${_pkgname}-${CARCH}-${pkgver}
}

build() {
	help2man ./${_pkgname}-${CARCH}-${pkgver} --no-info --section 8 --output "MAN-${pkgver}.8"
}

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "RELEASE-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/RELEASE.md"

	install -Dm644 "MAN-${pkgver}.8" "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
	gzip "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
}
