# Maintainer: Mikhail Artamonov <maximalis171091@yandex.ru>
# makepkg --printsrcinfo > .SRCINFO && makepkg -scC --nocheck --skipchecksums --skipinteg --skippgpcheck

pkgbase=blacklist-script
pkgname=('blacklist-script' 'blacklist-script-f2b')
pkgver=2.4.3
pkgrel=1
_tag="${pkgver}"
pkgdesc="Managing black and white lists of IP addresses."
arch=('any')
url="https://github.com/maximalisimus/blacklist-scripts.git"
license=('GPL3')
depends=(python fail2ban)
makedepends=()
replaces=("${pkgbase}")

source=("$pkgname::git+https://github.com/maximalisimus/blacklist-scripts.git#tag=${_tag}"
	)

sha256sums=('SKIP'
			)

prepare() {
	cd ${srcdir}/${pkgbase}
	mkdir -p ./post/ ./fail2ban
	make DESTDIR=./post/ TARGET=${pkgbase} install
	make DESTDIR=./fail2ban/ TARGET=${pkgbase} install-all
}

package_blacklist-script() {
	replaces=("${pkgname[0]}")
	
	mkdir -p $pkgdir/
	cp -a ${srcdir}/${pkgbase}/post/* $pkgdir/
}

package_blacklist-script-f2b() {
	replaces=("${pkgname[1]}")
	
	mkdir -p $pkgdir/
	cp -a ${srcdir}/${pkgbase}/fail2ban/* $pkgdir/
}
