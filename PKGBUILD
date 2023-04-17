# Maintainer: Amurru Zerouk <ammarzerouk[at]gmail[dot]com>
pkgname=ballerina-bin
_pkgname=ballerina
pkgver=2201.5.0
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
https://dist.ballerina.io/downloads/2201.5.0/ballerina-2201.5.0-swan-lake.zip
)
sha256sums=(
'1a0f01f502e85b5c01cc18c28ea1d2de61edd64c9c251d94f0cbef3bac8e349e'
'81b3b8645b563759edfd5041addd9672c110cd3e8b759d5914831aa037b25050'
)

prepare() {
	unzip -o ballerina-2201.5.0-swan-lake.zip
}

package() {
	_pkg=ballerina-2201.5.0-swan-lake
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -m644 "${srcdir}/${_pkg}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

	# launcher
	install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/bal"
}
