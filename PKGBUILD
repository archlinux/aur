pkgname=pgroonga
pkgver=2.1.6
pkgrel=1
pkgdesc="Fast fulltext search on PostgreSQL."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
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
	echo "You need to upgrade EXTENSION pgroonga CASCADE, "
	echo "In more detail, please refer to the PGroonga site's upgrading instructions:"
	echo "http://pgroonga.github.io/upgrade/"
        # Remove needless dotfiles
        rm -rf "$pkgdir/.*"
}
sha1sums=('c3bc3fa13d9a5227b1a38140a15ef2e74567f6c5')
