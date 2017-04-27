# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/users/palopezv>

pkgname=paccache-trim
pkgver=4
pkgrel=1
pkgdesc="Run paccache weekly to keep pacman cache on check."
arch=('any')
url="https://github.com/palopezv/package-trim/"
license=('custom:UNLICENSE')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/palopezv/$pkgname/archive/$pkgver.tar.gz")
sha384sums=('fa00780b0f57aca60df5cc8128d33ecff45af888c845370c720949f5c98ba648aec9a7c031a2d7593c3525bd67e095bf')
        
package() {
	_systemdpath=/usr/lib/systemd/system/
	install -Dm 644 "$srcdir/$pkgname-$pkgver/$pkgname.timer" "$pkgdir$_systemdpath$pkgname.timer"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/$pkgname.service" "$pkgdir$_systemdpath$pkgname.service"
	mkdir -p "$pkgdir$_systemdpath"/timers.target.wants
	ln -sf "$pkgdir$_systemdpath$pkgname.timer" "$pkgdir$_systemdpath"/timers.target.wants/
	install -Dm 644 "$srcdir/$pkgname-$pkgver"/LICENSE "$pkgdir/usr/share/licences/$pkgname"/UNLICENSE
}
