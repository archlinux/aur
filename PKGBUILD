# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnun
pkgver=1.6
pkgrel=1
pkgdesc="A build system for www.gnu.org translations."
arch=(any)
url="https://www.gnu.org/software/gnun/"
license=('GPL-3.0-or-later')
depends=('cvs' 'subversion' 'bzr' 'po4a' 'libxml2' 'mailutils' 'sed' 'wdiff' 'gawk')
backup=(etc/gnun/gnun.conf)
source=("https://ftpmirror.gnu.org/gnu/gnun/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('7d74b854fffbd72a59ad28d19c78f2359e6eff921363e24c782a89b4fc5ce4d6'
            'SKIP')
validpgpkeys=('BD9D4DEE7B2FF1CBEF2EE0C4E0ACD3E0CBE7874A')
               # Ineiev (fencepost) <ineiev@gnu.org>

prepare() {
	cd "$pkgname-$pkgver"
	  # gnu-mail from mailutils
	sed -i 's/\[mail\]/[gnu-mail]/' configure.ac
	autoreconf
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	            --libexecdir=/usr/share/gnun/scripts \
	            --sysconfdir=/etc/gnun \
	            --enable-multiviews
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
