# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=cassandra
pkgver=1.2.1
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
sha256sums=('a14b05d3667423b4a218068aa82f6ace0d5c6ab65aecef0b615f2a0aefdbb3a2')
