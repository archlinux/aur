# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=(spacetimedb{,-cli}-bin)
pkgver=1.10.0
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
sha256sums=('96ada2f1539799403046b64b45ad4595fa5eb1e75c962080c2f884c1eaa23409'
            'eaea8602c1b2808683100112f58fa5261ba01cb621aed236bab31537560a3529'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('dfbd86de93f360a7d25008d9bafda21c0e872d9a906355283fa905e6f8f8f6a5')
sha256sums_aarch64=('1b5ed930c3f1319d11ac5e3bd4f602943be7e2c3fc1ff42b27f49789667b51d0')

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
