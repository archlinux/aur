# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=(spacetimedb{,-cli}-bin)
pkgver=1.7.0
pkgrel=1
pkgdesc="A relational database and a server combined into one (bin version)"
arch=('x86_64' 'aarch64')
url="https://github.com/clockworklabs/SpacetimeDB"
license=('custom:BSL')
source=("spacetime-BSL-${pkgver}.txt::${url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
        'spacetimedb.service'
        'spacetimedb.sysusers')
_source=("spacetime-${CARCH}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/spacetime-${CARCH}-unknown-linux-gnu.tar.gz")
source_x86_64=("${_source[@]}")
source_aarch64=("${_source[@]}")
sha256sums=('1e2f3bd3dda5cad4ec7dea2c873e6cfb9fdbbb0db2c2b2aadc3180f00fab839a'
            'eaea8602c1b2808683100112f58fa5261ba01cb621aed236bab31537560a3529'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('d22d13bbc0712dd8bc66b57f18afaf38d241b56154dabe314bb988a42710b357')
sha256sums_aarch64=('6f96f1f4467da159009e9a51d04499e5493d227d2c81ab7a153cd11e739fb848')

_package() {
	install -Dm644 "spacetime-BSL-${pkgver}.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_spacetimedb-bin() {
	_package

	install -Dm755 'spacetimedb-standalone' -t "${pkgdir}/usr/bin/"

	install -Dm644 'spacetimedb.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 'spacetimedb.sysusers' "${pkgdir}/usr/lib/sysusers.d/spacetimedb.conf"
}

package_spacetimedb-cli-bin() {
	optdepends+=('binaryen: for wasm-opt')

	_package

	install -Dm755 'spacetimedb-cli' "${pkgdir}/usr/bin/spacetime"
}
