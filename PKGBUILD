# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=fcitx5-hazkey-bin
pkgver=0.2.0
pkgrel=3
pkgdesc="Japanese input method for fcitx5, powered by azooKey engine"
arch=('x86_64')
url="https://github.com/7ka-Hiira/fcitx5-hazkey"
license=('MIT')
depends=('fcitx5>=5.0.4' 'qt6-base')
optdepends=('hazkey-zenzai: Zenzai neural conversion support')
conflicts=('fcitx5-hazkey' 'fcitx5-hazkey-git')
provides=('fcitx5-hazkey' 'hazkey-server')
source=("https://github.com/7ka-Hiira/fcitx5-hazkey/releases/download/$pkgver/fcitx5-hazkey-$pkgver-x86_64.tar.gz"
		"LICENSE")
sha256sums=('5c863baf414adf6732f889b0c8f3ce931acae695ffacd1deb4a2f8307fcc3692'
            '36ae30a03484d88f0f90e1985750b0a3f43521bf0a5c8112354bec2de60e0c5b')
options=('!debug')

package() {
	cp -a "$srcdir/usr" "$pkgdir/"

	# Move files to adapt to Arch Linux environment
	cp -a ${pkgdir}/usr/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib/
	rm -r ${pkgdir}/usr/lib/x86_64-linux-gnu/
	rm ${pkgdir}/usr/bin/hazkey-settings
	ln -s /usr/lib/hazkey/hazkey-settings ${pkgdir}/usr/bin/hazkey-settings

	sed -i 's/x86_64-linux-gnu\///g' ${pkgdir}/usr/bin/hazkey-server

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
