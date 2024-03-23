# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240322
_srchash="ada492f6996db72f256775332d4f669b9bc513bb"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/ada492f6996db72f256775332d4f669b9bc513bb/LICENSE-MIT"
_license_sha256sum="fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d"
_prefix=$pkgname-$pkgver
source_x86_64=(
	$_prefix-radicle-httpd::$_srcurl/radicle-httpd
	$_prefix-radicle-httpd.1::$_srcurl/radicle-httpd.1
	$_prefix-LICENSE-MIT::$_license_url
	radicle-httpd.service
)
source_aarch64=(
	$_prefix-radicle-httpd::$_srcurl/radicle-httpd
	$_prefix-radicle-httpd.1::$_srcurl/radicle-httpd.1
	$_prefix-LICENSE-MIT::$_license_url
	radicle-httpd.service
)
sha256sums_x86_64=(
	'eb97d8c6347b8e5d6523cb4467a38a65babd0b834e784664cc55ae2bb3e1c1bc'
	'6f2c72ec0889148667d6de27832a113e0eeeaf28dc06135e6c874e2f9848c7b9'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'ffa5b9b67a32519ad4c3586b4355cac8a030dce0eac76cbf96f32eb6c8d60ea5'
	'5e0f4a01c78747bab2934cefad01ee4dd2c1d5ca16b333d5c9198657bc8fabc9'
	$_license_sha256sum
	'SKIP'
)
install="radicle-httpd-bin.install"
provides=('radicle-httpd')
conflicts=('radicle-httpd')

package() {
	install -Dm755 "$srcdir/$_prefix-radicle-httpd" "$pkgdir/usr/bin/radicle-httpd"
	install -Dm644 "$srcdir/radicle-httpd.service" "$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
	install -Dm644 "$srcdir/$_prefix-radicle-httpd.1" "$pkgdir/usr/share/man/man1/radicle-httpd.1"
	install -Dm644 "$_prefix-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
