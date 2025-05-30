# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pythops
_pkgname=oryx
pkgname=${_pkgname}-bin
pkgver=0.6
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
            '1415268ae1d7c17cd1a1c51a7f8741c96de567a0d9f83ae0511b52a1239a3c85e80c12be48efc75ae448df832d421254e3dcf9ec2bda73789f159db04a8370d1'
            'c71b5d847da00e127f4bb7fe664a2d51d176adee746eeb0ea60ac39f4fce3f2d46fbb980d5b575b08b0678900014377a578f7d754248833f13dd8d0f34cda8b2')
sha512sums_x86_64=('e7a54d758e2c2e961a36391be8356e2171c1acbe5505b6ca425c8d6bfe6a64afe35799f6cb9d017e1945aafd501fb09459dee9c5a081cb0fecfbeddd2072b53c')
sha512sums_aarch64=('e7a54d758e2c2e961a36391be8356e2171c1acbe5505b6ca425c8d6bfe6a64afe35799f6cb9d017e1945aafd501fb09459dee9c5a081cb0fecfbeddd2072b53c')


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
