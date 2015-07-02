# Contributor: 3ED <krzysztof1987@gmail.com>
pkgname=aurpac
pkgver=0.1b2.1
pkgrel=1
pkgdesc="Light'n'fast aur and pacman frontend."
arch=(any)
url="http://3ed.jogger.pl/2009/02/15/aurpac/"
license=('GPL')
depends=('curl')
optdepends=('pacman-color' 'gettext')
backup=(etc/aurpac.conf)
source=($pkgname-$pkgver.tar.bz2)
md5sums=('6fe056a2f9cf5ac0963b653d68e2a00d')

build() {
	cd "$srcdir"
#	--
	#PREFIX="/bla" aurpac <- work too [default is /usr]
	#sed -i 's|^PREFIX=".*" ###SED###$|PREFIX="/usr" ###SED###|' aurpac
#	---
	install -v -d "$pkgdir/usr/bin/" || return 1
	install -v -d "$pkgdir/etc/" || return 1
#	---
	install -v -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname" || return 1
	install -v -m644 "$srcdir/config" "$pkgdir/etc/$pkgname.conf" || return 1
#	---
	find mod/ -type d -exec install -v -m755 -d "$pkgdir/usr/share/aurpac/{}" \; || return 1
	find mod/ -type f -exec install -v -m644 "{}" "$pkgdir/usr/share/aurpac/{}" \; || return 1
}

#$cat=system
