# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=pgroonga
pkgver=2.4.4
pkgrel=1
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
sha1sums=('f4763bd3075ac1d29e9ec102a645d3f44b3ad2af'
          'SKIP')
sha256sums=('e5b29bfa4a2321a0ccc14b55d5156c3cb5cc03c08f7ec2d54ccc2212186292a4'
            'SKIP')