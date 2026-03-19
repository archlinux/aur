# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=spacetimedb
pkgname=(${_pkgbase}{,-cli}-bin)
pkgver=2.0.3
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
sha256sums=('db19fff6642bab34e61cd4127d3cccdd8598551182ef337d4c875d622573c954'
            'bc5673cdabd668504a1cee7bb6995a49eb4c2f7314fc18830d3d368a0c6bcc16'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('952ef5f0968875693e47baa27a1f589f08ce50a79e1ee73039e737f87040d586')
sha256sums_aarch64=('c477eaf8266cb19130043ea3a946e312cb8e573b1a40911d9f74dbc3f8974ec6')

_package() {
	install -Dm644 "spacetime-BSL-${pkgver}.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_spacetimedb-bin() {
	provides=(${_pkgbase})
	conflicts=(${_pkgbase})

	_package

	install -Dm755 'spacetimedb-standalone' -t "${pkgdir}/usr/bin/"

	install -Dm644 'spacetimedb.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 'spacetimedb.sysusers' "${pkgdir}/usr/lib/sysusers.d/spacetimedb.conf"
}

package_spacetimedb-cli-bin() {
	optdepends+=('binaryen: for wasm-opt')
	provides=(${_pkgbase}-cli)
	conflicts=(${_pkgbase}-cli)

	_package

	install -Dm755 'spacetimedb-cli' "${pkgdir}/usr/bin/spacetime"
}
