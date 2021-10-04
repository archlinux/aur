# Contributor: Nicholas Schlabach <Techcable@techcable.net>
# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=rr-bin
pkgver=5.5.0
pkgrel=1
pkgdesc="Binary record and replay framework: lightweight recording and deterministic debugging"
arch=('x86_64')
url='http://rr-project.org/'
license=('custom')
depends=('gdb')
source=("https://github.com/rr-debugger/rr/releases/download/$pkgver/rr-$pkgver-Linux-x86_64.tar.gz"
	"https://raw.githubusercontent.com/rr-debugger/rr/$pkgver/LICENSE")
sha256sums=('a76cda2b90b8e621c82e7779bb1a345e189291b3cff2c9d52681bb2ab07e4117'
            'fa03106ff7c9018337f1b489bdec8763a1a19b857466055f77637a0af7181f32')
provides=('rr')
conflicts=('rr' 'rr-git')

package() {
	for i in 'rr' 'signal-rr-recording.sh' 'rr_exec_stub_32' 'rr_exec_stub'; do
		install -Dm755 "rr-$pkgver-Linux-x86_64/bin/$i" "$pkgdir/usr/bin/$i"
	done
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpreload.so" "$pkgdir/usr/lib/rr/librrpreload.so"
	install -Dm755 "rr-$pkgver-Linux-x86_64/lib/rr/librrpreload_32.so" "$pkgdir/usr/lib/rr/librrpreload_32.so"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/rr/LICENSE"
	# Added on request of duongdominhchau, 16-Jul-2021: share files are needed
	cp -R  "rr-$pkgver-Linux-x86_64/share/" "$pkgdir/usr/"
}
