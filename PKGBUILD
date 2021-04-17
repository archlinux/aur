# Maintainer: Leo <i@setuid0.dev>

pkgname=phan
pkgver=4.0.4
pkgrel=2
pkgdesc="Static analyzer for PHP that prefers to minimize false-positives."
url="https://github.com/phan/phan/wiki"
arch=("any")
license=("MIT")
depends=("php>=7.2.0" "php-ast>=1.0.10")
source=(
	"${pkgname}-${pkgver}.phar::https://github.com/phan/phan/releases/download/${pkgver}/phan.phar"
	"${pkgname}-${pkgver}.phar.asc::https://github.com/phan/phan/releases/download/${pkgver}/phan.phar.asc"
	"https://raw.githubusercontent.com/phan/phan/${pkgver}/LICENSE"
)
validpgpkeys=(
	"A618F385C2FC002969A89FBE8101FB57DD8130F0"
)
# Upstream prefers to verify by gpg signature,
# leave dummy hash verification to let makepkg happy.
sha256sums=(
	SKIP
	SKIP
	SKIP
)

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

