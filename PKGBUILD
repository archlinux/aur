# Maintainer: Amurru Zerouk <ammarzerouk[at]gmail[dot]com>
pkgname=ballerina-bin
_pkgname=ballerina
pkgver=2201.4.0
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
https://dist.ballerina.io/downloads/2201.4.0/ballerina-2201.4.0-swan-lake.zip
)
sha256sums=(
'52abb0085381a1a0861970098dacc36d34350bf66648e4d23600c1f4a7fa89e4'
'81b3b8645b563759edfd5041addd9672c110cd3e8b759d5914831aa037b25050'
)

prepare() {
	unzip -o ballerina-2201.4.0-swan-lake.zip
}

package() {
	_pkg=ballerina-2201.4.0-swan-lake
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -m644 "${srcdir}/${_pkg}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

	# launcher
	install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/bal"
}
