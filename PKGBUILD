# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240313
_srchash="54aacc96197a48b79fcc260f94312d824f5e0a34"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/54aacc96197a48b79fcc260f94312d824f5e0a34/LICENSE-MIT"
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
	'9c1334f712faa5fac9492096509c6ae28dcc4b168bf4c24d46269978a0c346fb'
	'5e17e6a38d73d0ab4d1336b6bf52a639ef00dd756be71af888198c6e2ca74b14'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'038034366cee31a73f74ac219b4413edef760bbb2164be8bf3273e96cec74e22'
	'1ec4f0e606f476b2819fe5d6ad5bc7e51b740457c4c2bc6e7dad80d615ba4db2'
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
