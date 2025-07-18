# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

pkgname=(spacetimedb{,-cli}-bin)
pkgver=1.2.0
pkgrel=2
pkgdesc="A relational database and a server combined into one (bin version)"
arch=('x86_64' 'aarch64')
url="https://github.com/clockworklabs/SpacetimeDB"
license=('custom')
source=("${url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
        'spacetimedb.service'
        'spacetimedb.sysusers')
_source=("${url}/releases/download/v${pkgver}/spacetime-${CARCH}-unknown-linux-gnu.tar.gz")
source_x86_64=("${_source[@]}")
source_aarch64=("${_source[@]}")
sha256sums=('daf4315198791d954766ee48b96fa446ce229373077de5fab2af599707c5000f'
            '7558f529fffd9889d410cb8cf090548c4d8460a1df9aa963f46bedb4b0e1bc1e'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('8e525ce56432982676dc77cf68f8908ecd31bde16382cf82306fc0816dcf52de')
sha256sums_aarch64=('cb81198608faa33abd2ee6f4143f2615b0c18e37441e66b4a57242ffe5498140')

_package() {
	install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_spacetimedb-bin() {
	_package

	install -Dm755 'spacetimedb-standalone' "${pkgdir}/usr/bin/spacetimedb"

	install -Dm644 'spacetimedb.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 'spacetimedb.sysusers' "${pkgdir}/usr/lib/sysusers.d/spacetimedb.conf"
}

package_spacetimedb-cli-bin() {
	optdepends+=('binaryen: for wasm-opt')

	_package

	install -Dm755 'spacetimedb-cli' "${pkgdir}/usr/bin/spacetime"
}
