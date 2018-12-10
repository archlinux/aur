# Maintainer: Jason SW

pkgname=mikrolock
pkgver=1.2
pkgrel=1
pkgdesc='A fast native implementation of the minilock file format that can read and write encrypted miniLock files.'
arch=('i686' 'x86_64')
url='http://andre-simon.de/doku/mlock/en/mlock.php'
license=('GPL3')
depends=('libsodium')
optdepends=('qt5-base: Mikrolock GUI')
provides=('mlock')
conflicts=('mlock')
install="$pkgname.install"
changelog="$pkgname.changes"
source=("http://andre-simon.de/zip/$pkgname-$pkgver.tar.bz2"
"http://andre-simon.de/zip/$pkgname-$pkgver.tar.bz2.asc")
validpgpkeys=('B8C55574187F49180EDC763750FE0279D805A7C7')
sha512sums=('e95aed063da2aed9fd59f7fb0054e55ad0cfcacf449445dc91108e3d73cf5e09b2c5b67a14221901822410529f7df440ea63f95d545d1f2861427e053902f75d'
            'SKIP')


build() {
  cd "$pkgname-$pkgver"
  make
if pacman -Qs qt5-base; then
	make gui
fi
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
ln -s "/usr/bin/mikrolock" "$pkgdir/usr/bin/mlock"
ln -s "/usr/share/man/man1/mikrolock.1.gz" "$pkgdir/usr/share/man/man1/mlock.1.gz"
if pacman -Qs qt5-base; then
	make DESTDIR="$pkgdir" install-gui
	ln -s "/usr/bin/mikrolock-gui" "$pkgdir/usr/bin/mlock-gui"
fi
}

# vim: set ts=2 sw=2 et:
