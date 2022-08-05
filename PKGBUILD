# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish AT gmail.com>

pkgname=memavaild
pkgver=0.6
pkgrel=2
pkgdesc='Memory daemon that improves responsiveness during heavy swapping'
arch=('any')
url="https://github.com/hakavlad/memavaild"
license=('MIT')
depends=('python')
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sysusers.conf")
sha256sums=('3730b7f76211c62e0853a4ac026bd54fb87de360e2bd0eabb7c5ef1c099e4247'
            'f422f477870f55670270c1e26c04adba4ebb9dccecbba190b47c6f136bcb059f')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '36d' Makefile
}

package() {
	cd "$pkgname-$pkgver"
	make \
		DESTDIR="$pkgdir" \
		PREFIX=/usr \
		SBINDIR=/usr/bin \
		SYSCONFDIR=/etc \
		SYSTEMDUNITDIR=/usr/lib/systemd/system \
		base units
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/$pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
