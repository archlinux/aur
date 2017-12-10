# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnun
pkgver=0.11
pkgrel=2
pkgdesc="GNUnited Nations, build system for www.gnu.org translations"
arch=(any)
url="https://www.gnu.org/software/gnun/"
license=('GPL')
depends=('cvs' 'subversion' 'bzr' 'po4a' 'libxml2' 'mailutils' 'wdiff')
backup=(etc/gnun/gnun.conf)
source=("http://ftp.gnu.org/gnu/gnun/$pkgname-$pkgver.tar.gz")
sha256sums=('017079cc3225c33a4597c751d41cc360697faf263700f4793759da4a0906f034')

prepare() {
	cd "$pkgname-$pkgver"
	  # gnu-mail from mailutils
	sed -i 's/\[mail\]/[gnu-mail]/' configure.ac
	autoreconf
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/share/gnun/scripts \
	            --sysconfdir=/etc/gnun --enable-multiviews
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
