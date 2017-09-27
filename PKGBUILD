# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=cassandra
pkgver=1.3.2
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra"
arch=(i686 x86_64)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('php' 'cassandra-cpp-driver>=2.4.2')
backup=('etc/php/conf.d/cassandra.ini')
source=(https://pecl.php.net/get/${_pkgname}-${pkgver}.tgz)

build() {
    cd "$_pkgname-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

package() {
	cd "$_pkgname-$pkgver"
	echo ';extension=cassandra.so' > cassandra.ini 
	install -Dm644 cassandra.ini "$pkgdir/etc/php/conf.d/cassandra.ini"
	make INSTALL_ROOT="$pkgdir/" install
}
sha256sums=('ff80de20482021266426e8c431a2205bc9cb5c18caebe0219de709f6745025df')
