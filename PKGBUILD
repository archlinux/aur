# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnun
pkgver=1.4
pkgrel=2
pkgdesc="GNUnited Nations, build system for www.gnu.org translations"
arch=(any)
url="https://www.gnu.org/software/gnun/"
license=('GPL-3.0-or-later')
depends=('cvs' 'subversion' 'bzr' 'po4a' 'libxml2' 'mailutils' 'sed' 'wdiff' 'gawk')
backup=(etc/gnun/gnun.conf)
source=("http://ftp.gnu.org/gnu/gnun/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('8b2acdc22bedef8b4aee09f54fefb44047fad3c56d336e96ae53571dffde040a'
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
