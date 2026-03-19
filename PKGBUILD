# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=spacetimedb
pkgname=(${_pkgbase}{,-cli}-bin)
pkgver=2.0.4
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
sha256sums=('65e9dcc02b936f039fb8699211c94856227add0cc17bf9e8974531ad9e61564e'
            'bc5673cdabd668504a1cee7bb6995a49eb4c2f7314fc18830d3d368a0c6bcc16'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('ac6770978ab43030f0650501edfe6d25df97b885d6b34893c3061d5b2a4ba32d')
sha256sums_aarch64=('4cba597a442650572bd17ddb8dd49ff5436a3aece6d5fc7568b6bd3004af88c3')

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
