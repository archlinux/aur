# Maintainer: Leo <i@hardrain980.com>

pkgname=phan
pkgver=6.0.7
pkgrel=1
pkgdesc="Static analyzer for PHP that prefers to minimize false-positives."
url="https://github.com/phan/phan/wiki"
arch=("any")
license=("MIT")
depends=("php>=8.1.0")
optdepends=(
	"php-ast>=1.1.3: Needed for parsing ASTs"
	"php-var_representation: Suggested for converting values to strings in issue messages"
)
source=(
	"${pkgname}-${pkgver}.phar::https://github.com/phan/phan/releases/download/${pkgver}/phan.phar"
	"https://raw.githubusercontent.com/phan/phan/${pkgver}/LICENSE"
)
sha256sums=('0ed500e8ebd00cabf55d219547420cdc3f65b4f970fb1a4945841ed48118f8be' SKIP)

package() {
	install -D -m 644 \
		"${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m 755 \
		"${srcdir}/${pkgname}-${pkgver}.phar" \
		"${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"

	install -d "${pkgdir}/usr/bin"

	ln -s \
		"/usr/share/webapps/bin/${pkgname}.phar" \
		"${pkgdir}/usr/bin/${pkgname}"
}
