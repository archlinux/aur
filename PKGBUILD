# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Zweih
_pkgname=yaylog
pkgname=${_pkgname}-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A CLI utility to list recently installed packages with filtering, written in Go."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}.tar.gz")
sha256sums=('58566d593b0ff2ce3e1b3770a5baac92f7739ece1f1b23d5ce02525349b792bf'
            'd00a3c3555c5a5bfa1cd153516e6fea4e1be7c36254d17b4cccd55d6e490e9fa')
sha256sums_x86_64=('295659d01ec6fb1637e4133dc680d3bf6b4a496147dce67f3abb058383e7da68')
sha256sums_aarch64=('78b5656229e2b2b8a770c7df8ade5214a6ff2cd856124a574bab6d8561483d73')


prepare() {
	cd "${srcdir}/" || exit

	sed -i "s/yaylog 2.4.0/yaylog ${pkgver}/g" "${_pkgname}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
