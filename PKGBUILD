# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240129
_srchash="e58419a9b0cc21a7353c7a94756bb6bf42326ba4"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/e58419a9b0cc21a7353c7a94756bb6bf42326ba4/LICENSE-MIT"
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
	'5cd4f237d03111673a9ee0e199e39e296a80a3e438436dd12585d7d3c0a83d24'
	'df836e541995094eb3e4802426b2c3b15f5ab6ec51b846b539089a5a4f508d5f'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'c4becc16b7bcbcf6580cd0b2254b33b75ad6d68b0e13614eaf593c3a149504b9'
	'bc994933288f3c11c12a6d27aee0eea091ad22e8395b0343c178541345353233'
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
