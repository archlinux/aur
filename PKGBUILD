# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=pgroonga
pkgver=4.0.1
pkgrel=1
pkgdesc="Fast fulltext search on PostgreSQL."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pgroonga/pgroonga"
license=('custom:PostgreSQL')
source=("https://github.com/pgroonga/pgroonga/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "https://github.com/pgroonga/pgroonga/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
depends=('groonga' 'postgresql')
makedepends=('postgresql' 'clang' 'llvm')
validpgpkeys=(2701F317CFCCCB975CADE9C2624CF77434839225)

build() {
    cd $srcdir/$pkgname-$pkgver
    make -j$(nproc)
}

package() {
    pkgdesc="PGroonga is a PostgreSQL extension to use Groonga as index. PGroonga makes PostgreSQL fast full text search platform for all languages!"
    depends=('groonga' 'postgresql')

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
sha1sums=('ac63fdb551a9470848985652b0e32e1039978099'
    'SKIP')
sha256sums=('e2dfe40f3a0342e9ce4f1212043c46564fda3678e8cfda8587bbc37b103ebd17'
    'SKIP')
