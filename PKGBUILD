# Maintainer: Jason SW

pkgname=mikrolock
pkgver=1.1
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
sha512sums=('74845d56961c0a2e391df911d2837ad02f6e140e1d1429d713d6714bc79d962f0b71a9fade2d850be8eb68dd04fb6dc603c6f4c3126dfcdef5ed9a4007639bd7'
            'SKIP')


build() {
  cd "$pkgname-$pkgver"
  make
pacman -T qt5-base >/dev/null && make gui
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
pacman -T qt5-base >/dev/null && make DESTDIR="$pkgdir" install-gui
ln -s "/usr/bin/mikrolock" "$pkgdir/usr/bin/mlock"
ln -s "/usr/share/man/man1/mikrolock.1.gz" "$pkgdir/usr/share/man/man1/mlock.1.gz"
pacman -T qt5-base >/dev/null && ln -s "/usr/bin/mikrolock-gui" "$pkgdir/usr/bin/mlock-gui"
}

# vim: set ts=2 sw=2 et:
