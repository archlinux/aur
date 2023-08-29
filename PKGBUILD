# Maintainer: Amurru Zerouk <ammarzerouk[at]gmail[dot]com>
pkgname=ballerina-bin
_pkgname=ballerina
pkgver=2201.7.2
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
https://github.com/ballerina-platform/ballerina-distribution/releases/download/v2201.7.2/ballerina-2201.7.2-swan-lake.zip
)
sha256sums=(
'7a65e1705dd8868524452b07a32d8eee2f8a94534ac263947b9e2cfd0edfdcb2'
'c6616088acff52c744d8bdf0701d106de20259c5a9e067df44031e81c61f7086'
)

prepare() {
	unzip -o ballerina-2201.7.2-swan-lake.zip
}

package() {
	_pkg=ballerina-2201.7.2-swan-lake
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -m644 "${srcdir}/${_pkg}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

	# launcher
	install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/bal"
}
