# Contributor: Nicholas Schlabach <Techcable@techcable.net>
# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=rr-bin
pkgver=5.8.0
pkgrel=3
pkgdesc="Binary record and replay framework: lightweight recording and deterministic debugging"
arch=('x86_64')
url='http://rr-project.org/'
license=('custom')
depends=('gdb')
source=("https://github.com/rr-debugger/rr/releases/download/$pkgver/rr-$pkgver-Linux-x86_64.tar.gz"
	"https://raw.githubusercontent.com/rr-debugger/rr/$pkgver/LICENSE")
sha256sums=('fe545439c5200f1967f4847ed6608943462d4c753b53b6fe694dab8915d1028a'
            'aaec860979579376519b0bb376a317d0c52a7182f5dde5f362a8df3590312f9f')
provides=('rr')
conflicts=('rr' 'rr-git')

package() {
	for i in 'rr' 'signal-rr-recording.sh' 'rr_exec_stub_32' 'rr_exec_stub'; do
		install -Dm755 "rr-$pkgver-Linux-x86_64/bin/$i" "$pkgdir/usr/bin/$i"
	done
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpreload.so" "$pkgdir/usr/lib/rr/librrpreload.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpreload_32.so" "$pkgdir/usr/lib/rr/librrpreload_32.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpreload.so" "$pkgdir/usr/lib/rr/librrpreload.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpreload_32.so" "$pkgdir/usr/lib/rr/librrpreload_32.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librraudit.so" "$pkgdir/usr/lib/rr/librraudit.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librraudit_32.so" "$pkgdir/usr/lib/rr/librraudit_32.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpage.so" "$pkgdir/usr/lib/rr/librrpage.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpage_32.so" "$pkgdir/usr/lib/rr/librrpage_32.so"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/rr/LICENSE"

	# Added on request of duongdominhchau, 16-Jul-2021: share files are needed
	cp -R  "rr-$pkgver-Linux-x86_64/share/" "$pkgdir/usr/"
}
