pkgbase=blacklist-script
pkgname=('blacklist-script' 'blacklist-script-f2b')
pkgver=2.1.0
pkgrel=1
arch=('any')
url="https://github.com/maximalisimus/blacklist-scripts.git"
license=('GPL3')
depends=(python fail2ban)
makedepends=()
replaces=($pkgname)

source=("$pkgname::git+https://github.com/maximalisimus/blacklist-scripts.git"
	)

sha256sums=('SKIP'
			)

prepare() {
	cd ${srcdir}/${pkgname}
	mkdir -p ./post/ ./fail2ban
	make DESTDIR=./post/ TARGET=${pkgname} install
	make DESTDIR=./fail2ban/ TARGET=${pkgname} install-all
}

package_blacklist-script() {
	mkdir -p $pkgdir/
	cp -a ${srcdir}/${pkgname}/post/* $pkgdir/
}

package_blacklist-script-f2b() {
	mkdir -p $pkgdir/
	cp -a ${srcdir}/${pkgbase}/fail2ban/* $pkgdir/
}
