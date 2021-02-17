# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Christopher Jeffrey (https://keybase.io/chjj)
# Upstream: https://github.com/handshake-org/hs-miner
pkgname=hs-miner
pkgver=0.0.10
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Handshake CUDA miner"
url="https://handshake.org"
depends=(
	'nodejs'
)
makedepends=(
	'npm'
)
provides=(
	'hs-miner'
	'hs-mine'
)
source=(
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz"
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=(
	'67ff3517f24194b4e1375c565634d07e263ddcbee1c744e82592b6cb8e31f780'
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
