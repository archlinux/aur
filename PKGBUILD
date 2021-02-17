# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Christopher Jeffrey (https://keybase.io/chjj)
# Upstream: https://github.com/handshake-org/hs-airdrop
pkgname=hs-airdrop
pkgver=0.10.0
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Handshake airdrop redemption"
url="https://handshake.org"
depends=(
	'nodejs'
)
makedepends=(
	'npm'
)
provides=(
	'hs-airdrop'
)
source=(
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz"
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=(
	'b2dd2438f8552c880a4659cacb41ce59108d07bce08c291c6a690abe4f7bdfdc'
	'SKIP'
)
validpgpkeys=('B4B1F62DBAC084E333F3A04A8962AB9DE6666BBD')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	npm install --offline -g --user root --prefix "${pkgdir}"/usr --production

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
