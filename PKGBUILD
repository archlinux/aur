# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240207
_srchash="fe55de181d4320a0cd7a6ebd2820764280ae9adc"
pkgrel=1
pkgdesc="node for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/fe55de181d4320a0cd7a6ebd2820764280ae9adc/LICENSE-MIT"
_license_sha256sum="fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d"
_prefix=$pkgname-$pkgver
source_x86_64=(
	$_prefix-radicle-node::$_srcurl/radicle-node
	$_prefix-radicle-node.1::$_srcurl/radicle-node.1
	$_prefix-LICENSE-MIT::$_license_url
	radicle-node.service
)
source_aarch64=(
	$_srcurl/radicle-node
	$_srcurl/radicle-node.1
	$_prefix-LICENSE-MIT::$_license_url
	radicle-node.service
)
sha256sums_x86_64=(
	'b8216e125887effe7ca4f0240da6d0731edf4d23d14ca90a52444a9950d2b5cf'
	'225c3f1a47fa1cc95a20e1c7b9720972496cf60da2cd976bb89f05baf1d91654'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'040c1fcb453dee001ab17e86632df7d4d792ed5373db6c4670cc505a9d6b81a4'
	'bc8e54c6fa9e28481a669bd7fdf59132a9af8dd9838413aece0673753b1ef40f'
	$_license_sha256sum
	'SKIP'
)
install="radicle-node-bin.install"
provides=('radicle-node')
conflicts=('radicle-node')

package() {
	install -Dm755 "$_prefix-radicle-node" "$pkgdir/usr/bin/radicle-node"
	install -Dm644 "radicle-node.service" "$pkgdir/usr/lib/systemd/user/radicle-node.service"
	install -Dm644 "$_prefix-radicle-node.1" "$pkgdir/usr/share/man/man1/radicle-node.1"
	install -Dm644 "$_prefix-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
