# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ct-honeybee'
pkgver='20210914'
_commit='40157b03c9d93d932a92c308097efe0778410dc7'
pkgrel='1'
pkgdesc='Pollinates STHs between Certificate Transparency logs and auditors'
arch=('any')
url="https://github.com/SSLMate/$pkgname"
license=('CC0-1.0')
depends=('python')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
	"$pkgname.service"
	"$pkgname.timer"
	"$pkgname.1"
)
sha512sums=('9157c982f272d7b033bab36f42b378deead0b40a31c062f4a067198028022035ecb9b405428a479398820039318c0706e02ee1681d58ce885f5a7533d1a336be'
            '470c1107f0e21d40bf181a142df2900aae28ce1930b46ad881ef23508f5fb2f169b267a61a62c7c14711b088254432d0e32500d77a9530bb76196f3c6a7bc8e4'
            'b8cb1eb7385b002c8926d6a57f2df297c98b9c3d5a6adadf2fa156cd52cf4902b1ccd6c8163eb404675bea7477e1114b1e08fea292c4749f9233391b681c47c0'
            '1490250d25c3cdd1c3687ccd07c4eaeaece941fa13a42facf1e11af5d772d6b3ecf8ee011931ab2bcf354e437dd5ce72e4af69d7e6c415ca29b1e1c68f83c36f')

_sourcedirectory="$pkgname-$_commit"

package() {
	cd "$srcdir/"

	# Binary
	install -Dm755 "$_sourcedirectory/$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Service and timer
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname.timer" "$pkgdir/usr/lib/systemd/system/$pkgname.timer"

	# Man page
	install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
