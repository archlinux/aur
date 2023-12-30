# Maintainer: Amurru Zerouk <ammarzerouk[at]gmail[dot]com>
pkgname=ballerina-bin
_pkgname=ballerina
pkgver=2201.8.4
pkgrel=1
pkgdesc="Ballerina, an open-source programming language for the cloud"
arch=("any")
url="https://ballerina.io"
license=('Apache')
groups=()
depends=(jdk11-openjdk)
provides=("ballerina" "bal")
conflicts=("ballerina")
options=()
changelog=
source=(
${_pkgname}-bin.sh
https://github.com/ballerina-platform/ballerina-distribution/releases/download/v2201.8.4/ballerina-2201.8.4-swan-lake.zip
)
sha256sums=(
'7a65e1705dd8868524452b07a32d8eee2f8a94534ac263947b9e2cfd0edfdcb2'
'dcd5fdbc9c0e15cce24fca5a9471ced5f50051788683522c2584bcba744b925c'
)

prepare() {
	unzip -o ballerina-2201.8.4-swan-lake.zip
}

package() {
	_pkg=ballerina-2201.8.4-swan-lake
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -m644 "${srcdir}/${_pkg}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

	# launcher
	install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/bal"
}
