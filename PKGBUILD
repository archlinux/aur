# Maintainer: nic96
pkgname=kiwix-bin
pkgver=0.10
pkgrel=1
pkgdesc="Offline reader for Web content. It's especially intended to make Wikipedia available offline."
arch=('i686' 'x86_64')
url="http://www.kiwix.org"
license=('GPL3')
depends=('rpcbind' 'gtk2' 'alsa-lib' 'libxt' 'libcanberra' 'sqlite3' 'java-environment' 'zlib')
provides=('kiwix')
conflicts=('kiwix')
install='kiwix.install'
[[ "$CARCH" == 'x86_64' ]] && source=("https://ftp.nluug.nl/pub/kiwix/bin/$pkgver/kiwix-$pkgver-linux-x86_64.tar.bz2" "kiwix.desktop") && md5sums=('fed02651a771b99e6e252060246b7af0' '28f6bc22e23a3a73e60bbcf632b65827')
[[ "$CARCH" == 'i686' ]] && source=("https://ftp.nluug.nl/pub/kiwix/bin/$pkgver/kiwix-$pkgver-linux-i686.tar.bz2" "kiwix.desktop") && md5sums=('1a3f5c7e619fe4aa96d9d98dcb2ff02b' '28f6bc22e23a3a73e60bbcf632b65827')


package() {
	mkdir -p ${pkgdir}/usr/lib
	mkdir -p ${pkgdir}/usr/bin
	[ -d ${srcdir}/kiwix ] && rm -r ${srcdir}/kiwix
	[[ "$CARCH" == 'x86_64' ]] && mv ${srcdir}/kiwix-0.10-x86_84 ${srcdir}/kiwix
	[[ "$CARCH" == 'i686' ]] && mv ${srcdir}/kiwix-0.10-i686 ${srcdir}/kiwix
	cp -R -d ${srcdir}/kiwix ${pkgdir}/usr/lib/
	find ${pkgdir}/usr/lib/kiwix -perm -u=r -exec chmod a+r {} \; &> /dev/null
	find ${pkgdir}/usr/lib/kiwix -perm -u=x -exec chmod a+x {} \; &> /dev/null
	ln -f -s /usr/lib/kiwix/kiwix ${pkgdir}/usr/bin/kiwix
	ln -f -s /usr/lib/kiwix/bin/kiwix-serve ${pkgdir}/usr/bin/kiwix-serve
	install -D -m644 ${srcdir}/kiwix.desktop ${pkgdir}/usr/share/applications/kiwix.desktop
	install -D -m644 ${srcdir}/kiwix/chrome/icons/default/main.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/kiwix.png
	ln -sf /usr/lib/libz.so.1 ${pkgdir}/usr/lib/kiwix/xulrunner/libz.so.1
}
