# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/users/palopezv>

pkgname=paccache-trim
pkgver=5
pkgrel=1
pkgdesc="Run paccache weekly to keep pacman cache on check."
arch=('any')
url="https://github.com/palopezv/package-trim/"
license=('custom:UNLICENSE')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/palopezv/$pkgname/archive/$pkgver.tar.gz")
sha384sums=('b56a19fa86fdb907674bbce7ec720f295059cbfd57cb6998ee609b03727fb303bf18f54ba8c9201e7f904f547c511672')
        
package() {
	_systemdpath=/usr/lib/systemd/system/
	install -Dm 644 "$srcdir/$pkgname-$pkgver/$pkgname.timer" "$pkgdir$_systemdpath$pkgname.timer"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/$pkgname.service" "$pkgdir$_systemdpath$pkgname.service"
	mkdir -p "$pkgdir$_systemdpath"/timers.target.wants
	ln -sf "$pkgdir$_systemdpath$pkgname.timer" "$pkgdir$_systemdpath"/timers.target.wants/
	install -Dm 644 "$srcdir/$pkgname-$pkgver"/LICENSE "$pkgdir/usr/share/licences/$pkgname"/UNLICENSE
}
