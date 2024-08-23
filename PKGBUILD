# Maintainer: Amurru Zerouk <ammarzerouk[at]gmail[dot]com>
pkgname=ballerina-bin
_pkgname=ballerina
pkgver=2201.10.0
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
https://github.com/ballerina-platform/ballerina-distribution/releases/download/v${pkgver}/ballerina-${pkgver}-swan-lake.zip
)
sha256sums=(
'7089633fd3b49a6d3e5ea2c793e213907ca7fc4bd670a422f911a74bbf470c95'
'fa00fa7c30ade1f650ea118d80f46b174b0b87d593030d199a23758a9edbc3ea'
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
