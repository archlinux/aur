# Maintainer: Amurru Zerouk <ammarzerouk[at]gmail[dot]com>
pkgname=ballerina-bin
_pkgname=ballerina
pkgver=2201.12.7
pkgrel=1
pkgdesc="Ballerina, an open-source programming language for the cloud"
arch=("any")
url="https://ballerina.io"
license=('Apache')
groups=()
depends=(jdk-openjdk)
provides=("ballerina" "bal")
conflicts=("ballerina")
options=()
changelog=
source=(
	${_pkgname}-bin.sh
	https://github.com/ballerina-platform/ballerina-distribution/releases/download/v${pkgver}/ballerina-${pkgver}-swan-lake.zip
)
sha256sums=(
	'e83ceecf6c8b0402679072ebf544d5ecf6b81ed13a8c160c04e5b5272fc4e008'
	'2ca6eef7a40c644c5c33d86e20f30b66839688096044347d93f0ca0876a2cd0b'
)

prepare() {
	unzip -o ballerina-${pkgver}-swan-lake.zip
}

package() {
	_pkg=ballerina-${pkgver}-swan-lake
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -m644 "${srcdir}/${_pkg}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

	# launcher
	install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/bal"
}
