# Maintainer: jernick
pkgname=kiwix-bin
pkgver=0.9
pkgrel=1
pkgdesc="Offline reader for Web content. It's especially intended to make Wikipedia available offline."
arch=('i686' 'x86_64')
url="http://www.kiwix.org"
license=('GPL3')
depends=('rpcbind' 'gtk2' 'alsa-lib' 'libxt' 'libcanberra' 'sqlite3' 'java-environment')
provides=('kiwix')
conflicts=('kiwix')
install='kiwix.install'
[[ "$CARCH" == 'x86_64' ]] && source=("http://sourceforge.net/projects/kiwix/files/$pkgver/kiwix-$pkgver-linux-x86_64.tar.bz2" "kiwix.desktop") && md5sums=('df6216ba851819d9c3d0208d3ea639df' '28f6bc22e23a3a73e60bbcf632b65827')
[[ "$CARCH" == 'i686' ]] && source=("http://sourceforge.net/projects/kiwix/files/$pkgver/kiwix-$pkgver-linux-i686.tar.bz2" "kiwix.desktop") && md5sums=('b61fdc3937aa226f34f685ba0bc29db1' '28f6bc22e23a3a73e60bbcf632b65827')

#build() {
#}

package() {
	mkdir -p ${pkgdir}/usr/lib
	mkdir -p ${pkgdir}/usr/bin
	cp -R -d ${srcdir}/kiwix ${pkgdir}/usr/lib/
	find ${pkgdir}/usr/lib/kiwix -perm -u=w -exec chmod a+w {} \;	#Set permisions
	find ${pkgdir}/usr/lib/kiwix -perm -u=r -exec chmod a+r {} \;
	find ${pkgdir}/usr/lib/kiwix -perm -u=x -exec chmod a+x {} \;
	ln -f -s /usr/lib/kiwix/kiwix ${pkgdir}/usr/bin/kiwix
	install -D -m644 ${srcdir}/kiwix.desktop ${pkgdir}/usr/share/applications/kiwix.desktop
	install -D -m644 ${srcdir}/kiwix/chrome/icons/default/main.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/kiwix.png
}
