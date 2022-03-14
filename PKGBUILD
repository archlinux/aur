
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-bin
_pkgname=${pkgname%-*}
pkgver=1.8.1
pkgrel=2
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-git')
depends=('libretls')
source=(
	"https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz"
	'gmid.service'
	'gmid.conf'
)
sha256sums=(
	'7983a89f427bbdfb00ea118ff0471d8291afaa370814d7a93d6be294644592f7'
	'61450ba6fb7283b03f099e5172cf4e64bf40093ad2bd126b7915940d40922c9a'
	'4d943727a57dbf5f246963c0f90ccc54919cc2296538457e6b16f29f7580d9d6'
)

package() {
	cd "$srcdir"
	install -Dm644 gmid.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 gmid.conf -t "$pkgdir/usr/lib/sysusers.d"

	cd "$srcdir/$_pkgname-$pkgver-binaries"
	install -Dm755 "gmid.linux.amd64" "$pkgdir/usr/bin/gmid"
	install -Dm755 "gg.linux.amd64" "$pkgdir/usr/bin/gg"
	install -Dm644 gmid.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 gg.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
