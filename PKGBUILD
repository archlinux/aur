# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=cassandra
pkgver=1.2.2
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra"
arch=(i686 x86_64)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('php' 'cassandra-cpp-driver>=2.4.2')
backup=('etc/php/conf.d/cassandra.ini')

source=(
    http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz
)

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
sha256sums=('31db2a9ee2275e69ba0f7b0eec098f7a80cc6afa7c6a4eaa2d9d841ad040fb22')
