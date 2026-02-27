# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=spacetimedb
pkgname=(${_pkgbase}{,-cli}-bin)
pkgver=2.0.1
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
sha256sums=('a84fe80a6c8dee604ca8be086e4b6aae2b195e88465551c62d038a780f09791c'
            'bc5673cdabd668504a1cee7bb6995a49eb4c2f7314fc18830d3d368a0c6bcc16'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('7d696a0e60236057c985ac9f76b5884b9f0dc07e61412232a49de2e7065f0ab9')
sha256sums_aarch64=('7d696a0e60236057c985ac9f76b5884b9f0dc07e61412232a49de2e7065f0ab9')

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
