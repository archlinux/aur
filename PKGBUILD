# Maintainer: tippfehlr <tippfehlr at gmail dot com>

pkgname=radicle-httpd-bin
# there are no versions attached to the binaries, just upload dates.
pkgver=20240212
_srchash="9767b485c2aad1e23097d2b5165287ba84cfa452"
pkgrel=1
pkgdesc="http daemon for radicle, a peer-to-peer GitHub alternative"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_srcurl="https://files.radicle.xyz/$_srchash/$CARCH-unknown-linux-musl"
_license_url="https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/9767b485c2aad1e23097d2b5165287ba84cfa452/LICENSE-MIT"
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
	'8c2782e7fea13e6ff78106e2a770901fdbb1c5bf77d4613a348381c88a14deb7'
	'a3cdef81d205fa1a3ce24dc84262d51e8fb95a9e3ad3be8f000288263f099dbb'
	$_license_sha256sum
	'SKIP'
)
sha256sums_aarch64=(
	'c595ca988710914ba1d01c44a55561b9830ac61c351460d856904f771d3534a3'
	'c9e0dc7feb01d47de272ef9bf2e8f5cda7e5696f336d52595f05f64914f1a660'
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
