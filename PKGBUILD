# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=kashav
_pkgname=fsql
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Search through your filesystem with SQL-esque queries"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=()

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${_pkgname}-linux-amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${_pkgname}-linux-386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${_pkgname}-linux-arm64.tar.gz")
sha256sums_x86_64=('859e76c76b6dacc1dfaa500a25be52041f2910b1359a652659352c0997574187')
sha256sums_i686=('bd6635cd8c3515a4f89e118396a4f121d02093c5a63fd51d1eb9308f90b7c0c0')
sha256sums_aarch64=('7e00736538aad316a214f7087a66f6fbbb1c2108ac7b5acf5e2599dd2034208d')


case `uname -m` in
	"x86_64") _CARCH="amd64"
	;;

	"i686") _CARCH="386"
	;;

	"aarch64") _CARCH="arm64"
	;;
esac

package() {
	cd "${srcdir}/${_pkgname}-linux-${_CARCH}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
