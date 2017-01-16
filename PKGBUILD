# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnun
pkgver=0.11
pkgrel=2
pkgdesc="GNUnited Nations, build system for www.gnu.org translations"
arch=(any)
url="https://www.gnu.org/software/gnun/"
license=('GPL')
depends=(cvs subversion bzr po4a libxml2 mailutils wdiff)
backup=(etc/gnun/gnun.conf)
source=("http://ftp.gnu.org/gnu/gnun/$pkgname-$pkgver.tar.gz")
md5sums=('ebf842c947e936dc2be899b014db9422')

prepare() {
	cd "$pkgname-$pkgver"
	  # gnu-mail from mailutils
	sed -i 's/\[mail\]/[gnu-mail]/' configure.ac
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf
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
