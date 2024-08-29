# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey-bin
pkgver=0.0.6
pkgrel=2
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('fcitx5>=5.0.4')
optdepends=('vulkan-driver: Zenzai neural conversion support')
conflicts=('fcitx5-hazkey' 'fcitx5-hazkey-git')
provides=('fcitx5-hazkey')
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/releases/download/$pkgver/fcitx5-hazkey-$pkgver-x86_64.tar.gz"
		"LICENSE")
sha256sums=('3c980555d570b63584cf09383436753e7dc87c7b87c7a770761d633ca1cab49b'
			'36ae30a03484d88f0f90e1985750b0a3f43521bf0a5c8112354bec2de60e0c5b')

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
