# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-node-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240321
_srchash="0581c017ae1fa7cd3d553c855c439d40e12357e9"
pkgrel=1
pkgdesc="node for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/0581c017ae1fa7cd3d553c855c439d40e12357e9/LICENSE-MIT"
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
	'8a0801b88ad043c0fd156a9d26ee82c377258f613b06bec5edeaf135518c595c'
	'b384c6fd689714c6b7ebd09596c59973bf6b23e698dc135e6de9a7c2c6929dd7'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'5e1dbaa1aecd0e7bc886434e82685d8a7cfe08d8c31e254a1e23a451a469232b'
	'dc4fd647adbc91d24b815e01333ea135252130f1c55ba5ddb7ea7dbca333fde9'
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
