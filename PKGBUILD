# Maintainer: Leo <i@hardrain980.com>

pkgname=phan
pkgver=6.0.5
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
sha256sums=('d507d03b91dd033df0a65b96d9c97b4d8feb42bb2da55b8352d2031b292d314f' SKIP)

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
