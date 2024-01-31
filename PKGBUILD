# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240131
_srchash="15d17098315469bb180157d1c20344faa10f4f73"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/15d17098315469bb180157d1c20344faa10f4f73/LICENSE-MIT"
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
	'964ff1a81bd232faeb026fc46502a79756514f7a132b2d66f00f6251e15d3d93'
	'38a321b8a50fe8a9909dc126dfc9173fe2f0caab55a3383ec65adbedab05bab5'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'f287ea8759391a814ad70a0a062e1519d57d42449fd74026938175ac54ee631a'
	'f3f67a99ee1afbdc60c716b4245d164a7b4942793bfdd0797cae334ed7bcbff0'
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
