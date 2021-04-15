# Maintainer: Shaun Bouckaert <shaun@train-meditations.com>
pkgname=pam-pgsql-git
pkgver=0.7.3.2
pkgrel=1
pkgdesc="PAM module to provide authentication against PostgreSQL tables"
arch=('x86_64')
url="https://github.com/pam-pgsql/pam-pgsql"
license=('GPL')
depends=('pam' 'libgcrypt' 'postgresql-libs>=7.4')
makedepends=('git')
source=('pam-pgsql-git::git+https://github.com/pam-pgsql/pam-pgsql.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/release.//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
