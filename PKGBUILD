# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey-bin
pkgver=0.0.9
pkgrel=1
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
sha256sums=('58f243c69e621c4563b2232df4d86fc554128586113dae75803c00d1d1b61f72'
            '36ae30a03484d88f0f90e1985750b0a3f43521bf0a5c8112354bec2de60e0c5b')
options=('!debug')

package() {
	cp -a "$srcdir/usr" "$pkgdir/"

	# Move files to adapt to Arch Linux environment
	cp -a ${pkgdir}/usr/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib/
	rm -r ${pkgdir}/usr/lib/x86_64-linux-gnu/

	chmod +x ${pkgdir}/usr/lib/fcitx5/fcitx5-hazkey.so
	chmod +x ${pkgdir}/usr/lib/libhazkey.so

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
