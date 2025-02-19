# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=antonmedv
_pkgname=howto
pkgname=${_pkgname}-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="A terminal helper for querying LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=()


source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_linux_amd64")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_linux_arm64")
sha256sums=('fba9352499e9740890722bd09a06a0ddd78f87d309764b0344eaf68f9b9d5858'
            '6571d8e16196f5f348e9f9f4e6ff0a7f0b6e1e09ffd0fd1519abf976bc52b4c5')
sha256sums_x86_64=('5f378f7814a4de13a744200a28729acb5c8e7034302abf5e71f79a4ce154c604')
sha256sums_aarch64=('033880abd2dc16a3e4990949792c92701e916fc80aa03c4698b5cc38fc7856af')


case `uname -m` in
	"x86_64") _CARCH="amd64"
	;;

	"i686") _CARCH="386"
	;;

	"aarch64") _CARCH="arm64"
	;;
esac

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}_linux_${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
