# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=(spacetimedb{,-cli}-bin)
pkgver=1.11.0
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
sha256sums=('5586c5e4a60ebf99afe41c9fc183d32fe4e1ff1ff52816aa2dc845ba101ef048'
            'eaea8602c1b2808683100112f58fa5261ba01cb621aed236bab31537560a3529'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('63064ab6374d1512316d5f0eb1ef1b43be9dce2670bcb6560131416a119c4454')
sha256sums_aarch64=('18c618b167e74c6a42e8e62c0e7a8273ffc16eb91217cba38c3992ae5d20eccd')

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
