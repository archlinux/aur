# Maintainer: Kid <hi at xuann dot wang>

pkgname=replit-desktop-app
pkgver=1.0.5
pkgrel=1
pkgdesc='A native Replit experience free of browser distractions'
arch=(x86_64)
url=https://replit.com/desktop
license=(custom)
depends=(electron)
install=.install

source=(replit.deb::https://desktop.replit.com/download/deb
		replit)
sha256sums=('fdb60274b7b81b465d5e3d2cd6ad028c8f53d0f837745bfd1aaf2b110d7da49f'
            '9392ee9aced0cda3a50e00bc1fe40f75830388143254cbcb42929802b835d277')

package() {
	tar --extract --file data.tar.zst --directory $pkgdir

	find $pkgdir/usr/lib -type f ! -name '*.asar' -exec rm {} \;
	rmdir $pkgdir/usr/lib/replit/locales
	rm --recursive $pkgdir/usr/share/lintian

	install -D replit --target-directory $pkgdir/usr/bin
}
