pkgname=pgroonga
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast fulltext search on PostgreSQL."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/pgroonga/pgroonga"
license=('PostgreSQL')
source=("http://packages.groonga.org/source/pgroonga/$pkgname-$pkgver.tar.gz")
depends=('groonga' 'postgresql' 'mecab' 'mecab-ipadic')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install

	echo "-------------------------------------------------------------"
	echo "After install this package,"
        echo "please execute following commands to make fully installation."
	echo "-------------------------------------------------------------"
	echo "sudo -u postgres -H psql --command 'CREATE DATABASE pgroonga_test'"
	echo "sudo -u postgres -H psql -d pgroonga_test --command 'CREATE EXTENSION pgroonga'"
	echo "-------------------------------------------------------------"
	echo "*************************************************************"
	echo "                        NOTICE                               "
	echo "*************************************************************"
	echo "You need to run DROP EXTENSION pgroonga CASCADE, "
	echo "upgrade PGroonga binary, run CREATE EXTENSION pgroonga and "
	echo "create indexes again to upgrade to 1.0.0 from older versions."
	echo "In more detail, please see the PGroonga site's news."
	echo "http://pgroonga.github.io/news/"

}
sha1sums=('0004229351976c532cdb5777170098be5645e644')
