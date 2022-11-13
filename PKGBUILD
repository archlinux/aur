# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ct-honeybee'
pkgver='20210914'
_commit='40157b03c9d93d932a92c308097efe0778410dc7'
pkgrel='1'
pkgdesc='Pollinates STHs between Certificate Transparency logs and auditors'
arch=('any')
url="https://github.com/SSLMate/$pkgname"
license=('custom:CC0')
depends=('python')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz"
	"$pkgname.service"
	"$pkgname.timer"
	"$pkgname.1"
)
sha512sums=('9157c982f272d7b033bab36f42b378deead0b40a31c062f4a067198028022035ecb9b405428a479398820039318c0706e02ee1681d58ce885f5a7533d1a336be'
            '470c1107f0e21d40bf181a142df2900aae28ce1930b46ad881ef23508f5fb2f169b267a61a62c7c14711b088254432d0e32500d77a9530bb76196f3c6a7bc8e4'
            'b8cb1eb7385b002c8926d6a57f2df297c98b9c3d5a6adadf2fa156cd52cf4902b1ccd6c8163eb404675bea7477e1114b1e08fea292c4749f9233391b681c47c0'
            'c4d1e87b22a6e025b7a6887296718fc2fb0d248a15b685c4342ec87ada66d3014d1ad7a9ac140f6e0c95ac233d3f079881ef2d104e3311bfc3735804dfa0c0e5')

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

	# License
	install -Dm644 "$_sourcedirectory/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
