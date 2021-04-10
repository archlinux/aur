# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=pgroonga
pkgver=2.2.9
pkgrel=1
pkgdesc="Fast fulltext search on PostgreSQL."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pgroonga/pgroonga"
license=('custom:PostgreSQL')
source=("http://packages.groonga.org/source/pgroonga/$pkgname-$pkgver.tar.gz")
depends=('groonga')
makedepends=('postgresql' 'clang' 'llvm')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"

	echo "-------------------------------------------------------------"
	echo "After install this package,"
        echo "please execute following commands to make fully installation."
	echo "-------------------------------------------------------------"
	echo "sudo -u postgres -H psql --command 'CREATE DATABASE pgroonga_test'"
	echo "sudo -u postgres -H psql -d pgroonga_test --command 'CREATE EXTENSION pgroonga'"
	echo "-------------------------------------------------------------"
	echo "*************************************************************"
	echo "You need to upgrade EXTENSION pgroonga CASCADE, "
	echo "In more detail, please refer to the PGroonga site's upgrading instructions:"
	echo "http://pgroonga.github.io/upgrade/"
        # Remove needless dotfiles
        rm -rf "$pkgdir/.*"
}
sha1sums=('38d5524ca98afa6d528bf60ea68c8435e69c8728')
sha256sums=('f65978fa843cb1a5fb82e72531b88fae481e428930163c06a281e02c0140e3b7')
