# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnun
pkgver=1.0
pkgrel=1
pkgdesc="GNUnited Nations, build system for www.gnu.org translations"
arch=(any)
url="https://www.gnu.org/software/gnun/"
license=('GPL')
depends=('cvs' 'subversion' 'bzr' 'po4a' 'libxml2' 'mailutils' 'sed' 'wdiff')
backup=(etc/gnun/gnun.conf)
source=("http://ftp.gnu.org/gnu/gnun/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('e395b33943be7f187a7bf860081464182b787db2530cd1118959cb5a98928e90'
            'SKIP')
validpgpkeys=('3EAEC8A04B97561F2A52E35E1BBBC053D835DD16')
               # Ineiev <ineiev@gnu.org>

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
