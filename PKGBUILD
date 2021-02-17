# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Christopher Jeffrey (https://keybase.io/chjj)
# Upstream: https://github.com/handshake-org/hs-client
pkgname=hs-client
pkgver=0.0.9
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="HSD node and wallet client"
url="https://handshake.org"
depends=(
	'nodejs'
)
makedepends=(
	'npm'
	'node-gyp'
)
provides=(
    'hsd-cli'
    'hsd-rpc'
    'hsw-cli'
    'hsw-rpc'
)
source=(
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz"
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=(
	'b76d9132366eea28777d008e60f1a51e12ccc7a52b2e48df978806de1b368929'
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
