# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240322
_srchash="ada492f6996db72f256775332d4f669b9bc513bb"
pkgrel=1
pkgdesc="node for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/ada492f6996db72f256775332d4f669b9bc513bb/LICENSE-MIT"
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
	'c49a65d5b33ded44cf56af846292d7d740f385c5c0b7fa861d18c558eb45127f'
	'b0643e5e81c616a4858598f392427534e8d11f581decb403c27f40b7fb3f11a9'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'35fb5a15a034d824fb887f747b3a57dde0241ee53d439b6e66bc9cf3e62b9c0a'
	'b09e8adc4bf483deafe79a504d331178eeab4d7956b92b285cf6dcb9a73181ed'
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
