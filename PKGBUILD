# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('fcitx5>=5.0.4')
conflicts=('fcitx5-hazkey' 'fcitx5-hazkey-git')
provides=('fcitx5-hazkey')
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/releases/download/0.0.3/fcitx5-hazkey-0.0.3-x86_64.tar.gz"
		"LICENSE")
sha256sums=('a27423e1bf66ca4b892bce12fda4a56bbb742dfd0ca1bea5bcbdb05a94b140ff'
			'36ae30a03484d88f0f90e1985750b0a3f43521bf0a5c8112354bec2de60e0c5b')
options=(!strip)

prepare() {
	mkdir -p "$srcdir/fcitx5-hazkey"
	tar -xf "$srcdir/fcitx5-hazkey-$pkgver-x86_64.tar.gz" -C "$srcdir/fcitx5-hazkey"
}

package() {
	cp -a "$srcdir/fcitx5-hazkey/usr" "$pkgdir/"

	# Move files to adapt to Arch Linux environment
	cd "$pkgdir"
	cp -a usr/lib/x86_64-linux-gnu/* usr/lib/
	rm -rf usr/lib/x86_64-linux-gnu/

	chmod +x usr/lib/fcitx5/fcitx5-hazkey.so
	chmod +x usr/lib/libhazkey.so

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}