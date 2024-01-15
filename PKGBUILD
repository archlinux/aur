# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=pgroonga
pkgver=3.1.6
pkgrel=2
pkgdesc="Fast fulltext search on PostgreSQL."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pgroonga/pgroonga"
license=('custom:PostgreSQL')
source=("http://packages.groonga.org/source/pgroonga/$pkgname-$pkgver.tar.gz"
        "http://packages.groonga.org/source/pgroonga/$pkgname-$pkgver.tar.gz.asc")
depends=('groonga')
makedepends=('postgresql' 'clang' 'llvm')
validpgpkeys=(2701F317CFCCCB975CADE9C2624CF77434839225)

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
sha1sums=('cc7e3f0393e9251a6bdb1cc3690d58c86b75aa4d'
          'SKIP')
sha256sums=('5df1e92acb6074143a3a8d1c0e93a985424d4eef4a81f06ec406bc45a76f8f20'
            'SKIP')
