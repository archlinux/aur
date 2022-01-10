# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=gnun
pkgver=1.2
pkgrel=1
pkgdesc="GNUnited Nations, build system for www.gnu.org translations"
arch=(any)
url="https://www.gnu.org/software/gnun/"
license=('GPL')
depends=('cvs' 'subversion' 'bzr' 'po4a' 'libxml2' 'mailutils' 'sed' 'wdiff' 'gawk')
backup=(etc/gnun/gnun.conf)
source=("http://ftp.gnu.org/gnu/gnun/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('53733acd15f246d592aed7aa5810a48ec2f8a4dd0340ba6a5298fd2ae6f9adcf'
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
