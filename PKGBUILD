pkgname=pgroonga
pkgver=0.7.0
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
	echo "You can upgrade to 0.7.0 from 0.6.0 by override install."
	echo "You don't need to re-create pgroonga indexes."
	echo "In more detail, please see the PGroonga 0.7.0 release note."
	echo "https://github.com/pgroonga/pgroonga/blob/master/news.md#070-2015-07-10"

}
sha1sums=('b2dd4c561f52136a88e006d5d9404a69ef688591')
