# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgbase=radicle-node-bin
pkgname=radicle-node-bin-old
# there are no versions attached to the binaries, just upload dates.
pkgver=20240407
_srchash="bd8e0ebcda8f6f06dc20641a71614e3778a43fea"
pkgrel=1
pkgdesc="node for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/bd8e0ebcda8f6f06dc20641a71614e3778a43fea/LICENSE-MIT"
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
	'97aecca3ff65b97002675e32721b9bbfc9432bbe956e3ee8a68c1bae35798507'
	'0245b78ea87e2869e6b2895cee0a192842b4a70f6d57e30e171cc9bdb0bd00c2'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'9cf7e668d9e461760e16cdde00f3600d8a26dbe29e3bdfae18ece720fc9d09f3'
	'2177475e1a29ff9ba2ebc75e3ff83daea7bbda9ed615927c44a69ee0bf907519'
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
